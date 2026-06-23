
#import "GMGameCenter_ios.h"

#import "core/GMExtWire.h"

#import <Foundation/Foundation.h>
#import <GameKit/GameKit.h>
#import "TargetConditionals.h"

#include <cstdint>
#include <string>
#include <string_view>

#if !TARGET_OS_OSX
extern UIViewController *g_controller;
#else
extern NSViewController *g_controller;
static NSWindow *g_game_center_window = nil;
#endif

static NSString *NSStringFromStringView(std::string_view value)
{
    NSString *result = [[NSString alloc] initWithBytes:value.data()
                                                length:value.size()
                                              encoding:NSUTF8StringEncoding];
    return result != nil ? [result autorelease] : @"";
}

static std::string StringFromNSString(NSString *value)
{
    if (value == nil) return std::string();
    const char *utf8 = value.UTF8String;
    return utf8 != nullptr ? std::string(utf8) : std::string();
}

static std::string ErrorMessage(NSError *error)
{
    if (error == nil) return std::string();
    NSString *message = error.localizedDescription;
    if (message == nil || message.length == 0) message = error.description;
    return StringFromNSString(message);
}

static double DateToGMDate(NSDate *date)
{
    if (date == nil) return -1.0;
    return ((((double)[date timeIntervalSince1970]) + 0.5) / 86400.0) + 25569.0;
}

@interface GMGameCenter ()
@property(nonatomic, assign) gm::wire::GMFunction viewCallback;
@property(nonatomic, assign) gm::wire::GMFunction savedGamesEventCallback;
@property(nonatomic, retain) NSMutableArray *conflictGroups;
@end

@implementation GMGameCenter

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.conflictGroups = [NSMutableArray array];
        [[GKLocalPlayer localPlayer] registerListener:self];
    }
    return self;
}

- (void)dealloc
{
    [[GKLocalPlayer localPlayer] unregisterListener:self];
    self.conflictGroups = nil;
    [super dealloc];
}

#pragma mark - Stream helpers

- (gm::wire::StructStream)errorResult:(NSError *)error
                              success:(bool)success
{
    gm::wire::StructStream result;
    result.add("success", success);
    result.add("error_code", static_cast<std::int32_t>(error != nil ? error.code : 0));
    result.add("error_message", ErrorMessage(error));
    return result;
}

- (gm::wire::StructStream)playerStream:(GKPlayer *)player
{
    gm::wire::StructStream stream;
    if (player == nil) return stream;

    stream.add("alias", StringFromNSString(player.alias));
    stream.add("display_name", StringFromNSString(player.displayName));

    if (@available(iOS 12.4, macOS 10.14.6, *)) {
        stream.add("player_id", StringFromNSString(player.gamePlayerID));
        stream.add("game_player_id", StringFromNSString(player.gamePlayerID));
        stream.add("team_player_id", StringFromNSString(player.teamPlayerID));
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        stream.add("player_id", StringFromNSString(player.playerID));
        stream.add("game_player_id", StringFromNSString(player.playerID));
#pragma clang diagnostic pop
        stream.add("team_player_id", std::string_view(""));
    }

    return stream;
}

- (gm::wire::StructStream)savedGameMetadataStream:(GKSavedGame *)savedGame
{
    gm::wire::StructStream stream;
    if (savedGame == nil) return stream;

    stream.add("device_name", StringFromNSString(savedGame.deviceName));
    stream.add("modification_date", DateToGMDate(savedGame.modificationDate));
    stream.add("name", StringFromNSString(savedGame.name));
    return stream;
}

- (gm::wire::StructStream)leaderboardEntryStream:(GKLeaderboardEntry *)entry
{
    gm::wire::StructStream stream;
    if (entry == nil) return stream;

    stream.add("context", static_cast<std::uint64_t>(entry.context));
    stream.add("date", DateToGMDate(entry.date));
    stream.add("rank", static_cast<std::int64_t>(entry.rank));
    stream.add("score", static_cast<std::int64_t>(entry.score));
    stream.add("formatted_score", StringFromNSString(entry.formattedScore));
    stream.add("player", [self playerStream:entry.player]);
    return stream;
}

- (gm::wire::StructStream)legacyScoreStream:(GKScore *)score
{
    gm::wire::StructStream stream;
    if (score == nil) return stream;

    stream.add("context", static_cast<std::uint64_t>(score.context));
    stream.add("date", DateToGMDate(score.date));
    stream.add("rank", static_cast<std::int64_t>(score.rank));
    stream.add("score", static_cast<std::int64_t>(score.value));
    stream.add("formatted_score", StringFromNSString(score.formattedValue));
    stream.add("player", [self playerStream:score.player]);
    return stream;
}

- (gm::wire::StructStream)achievementStream:(GKAchievement *)achievement
{
    gm::wire::StructStream stream;
    if (achievement == nil) return stream;

    stream.add("identifier", StringFromNSString(achievement.identifier));
    stream.add("percent_complete", achievement.percentComplete);
    stream.add("is_completed", achievement.isCompleted == YES);
    stream.add("shows_completion_banner", achievement.showsCompletionBanner == YES);
    stream.add("player", [self playerStream:achievement.player]);
    stream.add("last_reported_date", DateToGMDate(achievement.lastReportedDate));
    return stream;
}

#pragma mark - View presentation

- (void)gamecenter_view_callback_subscribe:(gm::wire::GMFunction)callback
{
    self.viewCallback = callback;
}

- (bool)presentController:(GKGameCenterViewController *)controller
{
    if (controller == nil) return false;
    controller.gameCenterDelegate = self;
#if !TARGET_OS_OSX
    [g_controller presentViewController:controller animated:YES completion:nil];
#else
    [[GKDialogController sharedDialogController] presentViewController:controller];
#endif
    return true;
}

- (bool)gamecenter_present_view_default
{
    GKGameCenterViewController *controller = nil;
    if (@available(iOS 14.0, macOS 11.0, *)) {
        controller = [[[GKGameCenterViewController alloc] initWithState:GKGameCenterViewControllerStateDefault] autorelease];
    } else {
        controller = [[[GKGameCenterViewController alloc] init] autorelease];
        controller.viewState = GKGameCenterViewControllerStateDefault;
    }
    return [self presentController:controller];
}

- (bool)gamecenter_present_view_achievements
{
    GKGameCenterViewController *controller = nil;
    if (@available(iOS 14.0, macOS 11.0, *)) {
        controller = [[[GKGameCenterViewController alloc] initWithState:GKGameCenterViewControllerStateAchievements] autorelease];
    } else {
        controller = [[[GKGameCenterViewController alloc] init] autorelease];
        controller.viewState = GKGameCenterViewControllerStateAchievements;
    }
    return [self presentController:controller];
}

- (bool)gamecenter_present_view_achievement:(std::string_view)achievement_id
{
    if (@available(iOS 14.0, macOS 11.0, *)) {
        GKGameCenterViewController *controller = [[[GKGameCenterViewController alloc]
            initWithAchievementID:NSStringFromStringView(achievement_id)] autorelease];
        return [self presentController:controller];
    }
    return false;
}

- (bool)gamecenter_present_view_leaderboards
{
    GKGameCenterViewController *controller = nil;
    if (@available(iOS 14.0, macOS 11.0, *)) {
        controller = [[[GKGameCenterViewController alloc] initWithState:GKGameCenterViewControllerStateLeaderboards] autorelease];
    } else {
        controller = [[[GKGameCenterViewController alloc] init] autorelease];
        controller.viewState = GKGameCenterViewControllerStateLeaderboards;
    }
    return [self presentController:controller];
}

- (bool)gamecenter_present_view_leaderboard:(std::string_view)leaderboard_id
                                  time_scope:(gm_enums::GameCenterLeaderboardTimeScope)time_scope
                                player_scope:(gm_enums::GameCenterLeaderboardPlayerScope)player_scope
{
    GKLeaderboardTimeScope ts = static_cast<GKLeaderboardTimeScope>(time_scope);
    GKLeaderboardPlayerScope ps = static_cast<GKLeaderboardPlayerScope>(player_scope);

    GKGameCenterViewController *controller = nil;
    if (@available(iOS 14.0, macOS 11.0, *)) {
        controller = [[[GKGameCenterViewController alloc]
            initWithLeaderboardID:NSStringFromStringView(leaderboard_id)
                       playerScope:ps
                         timeScope:ts] autorelease];
    } else {
        controller = [[[GKGameCenterViewController alloc] init] autorelease];
        controller.viewState = GKGameCenterViewControllerStateLeaderboards;
        controller.leaderboardIdentifier = NSStringFromStringView(leaderboard_id);
        controller.leaderboardTimeScope = ts;
    }
    return [self presentController:controller];
}

- (void)gameCenterViewControllerDidFinish:(GKGameCenterViewController *)controller
{
    bool success = controller != nil;
#if !TARGET_OS_OSX
    if (controller != nil) [g_controller dismissViewControllerAnimated:YES completion:nil];
#else
    if (controller != nil) [[GKDialogController sharedDialogController] dismiss:self];
#endif

    if (self.viewCallback) {
        gm::wire::StructStream result;
        result.add("success", success);
        self.viewCallback.call(result);
    }
}

#pragma mark - Local player

- (void)gamecenter_local_player_authenticate:(gm::wire::GMFunction)callback
{
    [GKLocalPlayer localPlayer].authenticateHandler = ^(
#if !TARGET_OS_OSX
        UIViewController *viewController,
#else
        NSViewController *viewController,
#endif
        NSError *error)
    {
        GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
        std::string state = "unknown";

        if (viewController != nil) {
#if !TARGET_OS_OSX
            [g_controller presentViewController:viewController animated:YES completion:nil];
#else
            [[GKDialogController sharedDialogController]
                presentViewController:(NSViewController<GKViewController> *)viewController];
#endif
            state = "presenting_view";
        } else if (localPlayer.isAuthenticated) {
            state = "authenticated";
        }

        gm::wire::StructStream result = [self errorResult:error success:(error == nil)];
        result.add("authentication_state", state);
        result.add("authenticated", localPlayer.isAuthenticated == YES);
        result.add("player", [self playerStream:localPlayer]);
        callback.call(result);
    };
}

- (bool)gamecenter_local_player_is_authenticated { return [GKLocalPlayer localPlayer].isAuthenticated == YES; }
- (bool)gamecenter_local_player_is_underage { return [GKLocalPlayer localPlayer].isUnderage == YES; }

- (bool)gamecenter_local_player_is_multiplayer_gaming_restricted
{
    if (@available(iOS 13.0, macOS 10.15, *)) {
        return [GKLocalPlayer localPlayer].isMultiplayerGamingRestricted == YES;
    }
    return false;
}

- (bool)gamecenter_local_player_is_personalized_communication_restricted
{
    if (@available(iOS 14.0, macOS 11.0, *)) {
        return [GKLocalPlayer localPlayer].isPersonalizedCommunicationRestricted == YES;
    }
    return false;
}

- (gm::wire::DataStream)gamecenter_local_player_get_info
{
    return [self playerStream:[GKLocalPlayer localPlayer]];
}

#pragma mark - Saved games

- (void)gamecenter_saved_games_callback_subscribe:(gm::wire::GMFunction)callback
{
    self.savedGamesEventCallback = callback;
}

- (void)gamecenter_saved_games_fetch:(gm::wire::GMFunction)callback
{
    [[GKLocalPlayer localPlayer] fetchSavedGamesWithCompletionHandler:^(NSArray<GKSavedGame *> *savedGames, NSError *error) {
        gm::wire::ArrayStream slots;
        for (GKSavedGame *savedGame in savedGames ?: @[]) slots.push([self savedGameMetadataStream:savedGame]);

        gm::wire::StructStream result = [self errorResult:error success:(error == nil)];
        result.add("slots", slots);
        callback.call(result);
    }];
}

- (void)gamecenter_saved_games_save:(std::string_view)name
                               data:(std::string_view)data
                           callback:(gm::wire::GMFunction)callback
{
    NSString *saveName = NSStringFromStringView(name);
    NSData *saveData = [NSStringFromStringView(data) dataUsingEncoding:NSUTF8StringEncoding];

    [[GKLocalPlayer localPlayer] saveGameData:saveData withName:saveName completionHandler:^(GKSavedGame *savedGame, NSError *error) {
        gm::wire::StructStream result = [self errorResult:error success:(error == nil)];
        result.add("name", StringFromNSString(saveName));
        result.add("slot", [self savedGameMetadataStream:savedGame]);
        callback.call(result);
    }];
}

- (void)gamecenter_saved_games_delete:(std::string_view)name
                             callback:(gm::wire::GMFunction)callback
{
    NSString *saveName = NSStringFromStringView(name);
    [[GKLocalPlayer localPlayer] deleteSavedGamesWithName:saveName completionHandler:^(NSError *error) {
        gm::wire::StructStream result = [self errorResult:error success:(error == nil)];
        result.add("name", StringFromNSString(saveName));
        callback.call(result);
    }];
}

- (void)gamecenter_saved_games_get_data:(std::string_view)name
                               callback:(gm::wire::GMFunction)callback
{
    NSString *saveName = NSStringFromStringView(name);
    [[GKLocalPlayer localPlayer] fetchSavedGamesWithCompletionHandler:^(NSArray<GKSavedGame *> *savedGames, NSError *fetchError) {
        if (fetchError != nil) {
            gm::wire::StructStream result = [self errorResult:fetchError success:false];
            result.add("name", StringFromNSString(saveName));
            result.add("data", std::string_view(""));
            callback.call(result);
            return;
        }

        GKSavedGame *match = nil;
        for (GKSavedGame *savedGame in savedGames ?: @[]) {
            if ([savedGame.name isEqualToString:saveName]) { match = savedGame; break; }
        }

        if (match == nil) {
            gm::wire::StructStream result;
            result.add("success", false);
            result.add("name", StringFromNSString(saveName));
            result.add("data", std::string_view(""));
            result.add("error_code", static_cast<std::int32_t>(0));
            result.add("error_message", std::string_view("Saved game was not found."));
            callback.call(result);
            return;
        }

        [match loadDataWithCompletionHandler:^(NSData *loadedData, NSError *loadError) {
            NSString *text = loadedData != nil
                ? [[[NSString alloc] initWithData:loadedData encoding:NSUTF8StringEncoding] autorelease]
                : @"";

            gm::wire::StructStream result = [self errorResult:loadError success:(loadError == nil)];
            result.add("name", StringFromNSString(saveName));
            result.add("data", StringFromNSString(text));
            callback.call(result);
        }];
    }];
}

- (void)gamecenter_saved_games_resolve_conflict:(double)conflict_id
                                           data:(std::string_view)data
                                       callback:(gm::wire::GMFunction)callback
{
    NSInteger index = (NSInteger)conflict_id;
    if (index < 0 || index >= (NSInteger)self.conflictGroups.count) {
        gm::wire::StructStream result;
        result.add("success", false);
        result.add("conflict_id", static_cast<std::int32_t>(index));
        result.add("error_code", static_cast<std::int32_t>(0));
        result.add("error_message", std::string_view("Invalid conflict ID."));
        callback.call(result);
        return;
    }

    NSArray<GKSavedGame *> *conflicts = self.conflictGroups[index];
    NSData *resolvedData = [NSStringFromStringView(data) dataUsingEncoding:NSUTF8StringEncoding];

    [[GKLocalPlayer localPlayer] resolveConflictingSavedGames:conflicts
                                                    withData:resolvedData
                                           completionHandler:^(NSArray<GKSavedGame *> *savedGames, NSError *error) {
        gm::wire::ArrayStream slots;
        for (GKSavedGame *savedGame in savedGames ?: @[]) slots.push([self savedGameMetadataStream:savedGame]);

        gm::wire::StructStream result = [self errorResult:error success:(error == nil)];
        result.add("conflict_id", static_cast<std::int32_t>(index));
        result.add("slots", slots);
        callback.call(result);
    }];
}

- (void)player:(GKPlayer *)player hasConflictingSavedGames:(NSArray<GKSavedGame *> *)savedGames
{
    NSInteger conflictId = self.conflictGroups.count;
    [self.conflictGroups addObject:savedGames];

    if (!self.savedGamesEventCallback) return;

    gm::wire::ArrayStream slots;
    for (GKSavedGame *savedGame in savedGames ?: @[]) slots.push([self savedGameMetadataStream:savedGame]);

    gm::wire::StructStream event;
    event.add("type", std::string_view("conflict"));
    event.add("conflict_id", static_cast<std::int32_t>(conflictId));
    event.add("player", [self playerStream:player]);
    event.add("slots", slots);
    self.savedGamesEventCallback.call(event);
}

- (void)player:(GKPlayer *)player didModifySavedGame:(GKSavedGame *)savedGame
{
    if (!self.savedGamesEventCallback) return;

    gm::wire::StructStream event;
    event.add("type", std::string_view("modified"));
    event.add("player", [self playerStream:player]);
    event.add("slot", [self savedGameMetadataStream:savedGame]);
    self.savedGamesEventCallback.call(event);
}

#pragma mark - Leaderboards

- (void)gamecenter_leaderboard_submit:(std::string_view)leaderboard_id
                                score:(double)score
                              context:(double)context
                             callback:(gm::wire::GMFunction)callback
{
    NSString *identifier = NSStringFromStringView(leaderboard_id);

    void (^completion)(NSError *) = ^(NSError *error) {
        gm::wire::StructStream result = [self errorResult:error success:(error == nil)];
        result.add("leaderboard_id", StringFromNSString(identifier));
        result.add("score", score);
        result.add("context", context);
        callback.call(result);
    };

    if (@available(iOS 14.0, macOS 11.0, *)) {
        [GKLeaderboard submitScore:(NSInteger)score
                           context:(NSUInteger)context
                            player:[GKLocalPlayer localPlayer]
                    leaderboardIDs:@[identifier]
                 completionHandler:completion];
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        GKScore *legacyScore = [[[GKScore alloc] initWithLeaderboardIdentifier:identifier] autorelease];
        legacyScore.value = (int64_t)score;
        legacyScore.context = (uint64_t)context;
        [GKScore reportScores:@[legacyScore] withCompletionHandler:completion];
#pragma clang diagnostic pop
    }
}

- (void)gamecenter_leaderboard_load:(std::string_view)leaderboard_id
                         time_scope:(gm_enums::GameCenterLeaderboardTimeScope)time_scope
                        range_start:(double)range_start
                        range_count:(double)range_count
                       player_scope:(gm_enums::GameCenterLeaderboardPlayerScope)player_scope
                           callback:(gm::wire::GMFunction)callback
{
    NSString *identifier = NSStringFromStringView(leaderboard_id);
    GKLeaderboardTimeScope ts = static_cast<GKLeaderboardTimeScope>(time_scope);
    GKLeaderboardPlayerScope ps = static_cast<GKLeaderboardPlayerScope>(player_scope);
    NSRange range = NSMakeRange((NSUInteger)range_start, (NSUInteger)range_count);

    if (@available(iOS 14.0, macOS 11.0, *)) {
        [GKLeaderboard loadLeaderboardsWithIDs:@[identifier] completionHandler:^(NSArray<GKLeaderboard *> *leaderboards, NSError *loadError) {
            GKLeaderboard *leaderboard = leaderboards.firstObject;
            if (loadError != nil || leaderboard == nil) {
                gm::wire::StructStream result = [self errorResult:loadError success:false];
                result.add("leaderboard_id", StringFromNSString(identifier));
                result.add("entries", gm::wire::ArrayStream());
                callback.call(result);
                return;
            }

            [leaderboard loadEntriesForPlayerScope:ps timeScope:ts range:range completionHandler:^(GKLeaderboardEntry *localEntry, NSArray<GKLeaderboardEntry *> *entries, NSInteger totalPlayerCount, NSError *error) {
                gm::wire::ArrayStream entryArray;
                for (GKLeaderboardEntry *entry in entries ?: @[]) entryArray.push([self leaderboardEntryStream:entry]);

                gm::wire::StructStream result = [self errorResult:error success:(error == nil)];
                result.add("leaderboard_id", StringFromNSString(identifier));
                result.add("time_scope", static_cast<std::int32_t>(time_scope));
                result.add("range_start", range_start);
                result.add("range_count", range_count);
                result.add("player_scope", static_cast<std::int32_t>(player_scope));
                result.add("leaderboard_title", StringFromNSString(leaderboard.title));
                result.add("leaderboard_group", StringFromNSString(leaderboard.groupIdentifier));
                result.add("leaderboard_type", static_cast<std::int32_t>(leaderboard.type));
                result.add("leaderboard_start_date", DateToGMDate(leaderboard.startDate));
                result.add("leaderboard_next_start_date", DateToGMDate(leaderboard.nextStartDate));
                result.add("leaderboard_duration", leaderboard.duration);
                result.add("total_players_count", static_cast<std::int64_t>(totalPlayerCount));
                result.add("local_entry", [self leaderboardEntryStream:localEntry]);
                result.add("entries", entryArray);
                callback.call(result);
            }];
        }];
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        GKLeaderboard *request = [[[GKLeaderboard alloc] init] autorelease];
        request.identifier = identifier;
        request.timeScope = ts;
        request.playerScope = ps;
        request.range = range;

        [request loadScoresWithCompletionHandler:^(NSArray<GKScore *> *scores, NSError *error) {
            gm::wire::ArrayStream entryArray;
            for (GKScore *entry in scores ?: @[]) entryArray.push([self legacyScoreStream:entry]);

            gm::wire::StructStream result = [self errorResult:error success:(error == nil)];
            result.add("leaderboard_id", StringFromNSString(identifier));
            result.add("time_scope", static_cast<std::int32_t>(time_scope));
            result.add("range_start", range_start);
            result.add("range_count", range_count);
            result.add("player_scope", static_cast<std::int32_t>(player_scope));
            result.add("leaderboard_title", StringFromNSString(request.title));
            result.add("leaderboard_group", StringFromNSString(request.groupIdentifier));
            result.add("leaderboard_type", static_cast<std::int32_t>(-1));
            result.add("leaderboard_start_date", -1.0);
            result.add("leaderboard_next_start_date", -1.0);
            result.add("leaderboard_duration", -1.0);
            result.add("total_players_count", static_cast<std::int64_t>(scores.count));
            result.add("local_entry", [self legacyScoreStream:request.localPlayerScore]);
            result.add("entries", entryArray);
            callback.call(result);
        }];
#pragma clang diagnostic pop
    }
}

#pragma mark - Achievements

- (void)gamecenter_achievement_report:(std::string_view)identifier
                     percent_complete:(double)percent_complete
               show_completion_banner:(bool)show_completion_banner
                             callback:(gm::wire::GMFunction)callback
{
    NSString *achievementId = NSStringFromStringView(identifier);
    GKAchievement *achievement = [[[GKAchievement alloc] initWithIdentifier:achievementId] autorelease];
    achievement.percentComplete = percent_complete;
    achievement.showsCompletionBanner = show_completion_banner;

    [GKAchievement reportAchievements:@[achievement] withCompletionHandler:^(NSError *error) {
        gm::wire::StructStream result = [self errorResult:error success:(error == nil)];
        result.add("identifier", StringFromNSString(achievementId));
        result.add("percent_complete", percent_complete);
        callback.call(result);
    }];
}

- (void)gamecenter_achievement_reset_all:(gm::wire::GMFunction)callback
{
    [GKAchievement resetAchievementsWithCompletionHandler:^(NSError *error) {
        callback.call([self errorResult:error success:(error == nil)]);
    }];
}

- (void)gamecenter_achievement_load:(gm::wire::GMFunction)callback
{
    [GKAchievement loadAchievementsWithCompletionHandler:^(NSArray<GKAchievement *> *achievements, NSError *error) {
        gm::wire::ArrayStream values;
        for (GKAchievement *achievement in achievements ?: @[]) values.push([self achievementStream:achievement]);

        gm::wire::StructStream result = [self errorResult:error success:(error == nil)];
        result.add("achievements", values);
        callback.call(result);
    }];
}

#pragma mark - Access point

- (bool)gamecenter_access_point_set_active:(bool)active
{
    if (@available(iOS 14.0, macOS 11.0, *)) { [GKAccessPoint shared].active = active; return true; }
    return false;
}

- (bool)gamecenter_access_point_get_active
{
    if (@available(iOS 14.0, macOS 11.0, *)) return [GKAccessPoint shared].active == YES;
    return false;
}

- (bool)gamecenter_access_point_set_location:(gm_enums::GameCenterAccessPointLocation)location
{
    if (@available(iOS 14.0, macOS 11.0, *)) {
        [GKAccessPoint shared].location = static_cast<GKAccessPointLocation>(location);
        return true;
    }
    return false;
}

- (double)gamecenter_access_point_get_location
{
    if (@available(iOS 14.0, macOS 11.0, *)) return (double)[GKAccessPoint shared].location;
    return -1;
}

- (bool)gamecenter_access_point_is_presenting_game_center
{
    if (@available(iOS 14.0, macOS 11.0, *)) return [GKAccessPoint shared].isPresentingGameCenter == YES;
    return false;
}

- (bool)gamecenter_access_point_is_visible
{
    if (@available(iOS 14.0, macOS 11.0, *)) return [GKAccessPoint shared].visible == YES;
    return false;
}

- (bool)gamecenter_access_point_set_show_highlights:(bool)show
{
    if (@available(iOS 14.0, macOS 11.0, *)) { [GKAccessPoint shared].showHighlights = show; return true; }
    return false;
}

- (bool)gamecenter_access_point_get_show_highlights
{
    if (@available(iOS 14.0, macOS 11.0, *)) return [GKAccessPoint shared].showHighlights == YES;
    return false;
}

- (double)gamecenter_access_point_get_coordinate:(gm_enums::GameCenterAccessPointCoordinate)coordinate
{
    if (@available(iOS 14.0, macOS 11.0, *)) {
        CGRect frame = [GKAccessPoint shared].frameInScreenCoordinates;
        switch (coordinate) {
            case gm_enums::GameCenterAccessPointCoordinate::X: return frame.origin.x;
            case gm_enums::GameCenterAccessPointCoordinate::Y: return frame.origin.y;
            case gm_enums::GameCenterAccessPointCoordinate::Width: return frame.size.width;
            case gm_enums::GameCenterAccessPointCoordinate::Height: return frame.size.height;
        }
    }
    return 0;
}

- (bool)gamecenter_access_point_present_with_state:(gm_enums::GameCenterViewState)state
                                          callback:(gm::wire::GMFunction)callback
{
    if (@available(iOS 14.0, macOS 11.0, *)) {
        [[GKAccessPoint shared] triggerAccessPointWithState:static_cast<GKGameCenterViewControllerState>(state) handler:^{
            gm::wire::StructStream result;
            result.add("success", true);
            callback.call(result);
        }];
        return true;
    }
    return false;
}

- (bool)gamecenter_access_point_present:(gm::wire::GMFunction)callback
{
    if (@available(iOS 14.0, macOS 11.0, *)) {
        [[GKAccessPoint shared] triggerAccessPointWithHandler:^{
            gm::wire::StructStream result;
            result.add("success", true);
            callback.call(result);
        }];
        return true;
    }
    return false;
}

@end

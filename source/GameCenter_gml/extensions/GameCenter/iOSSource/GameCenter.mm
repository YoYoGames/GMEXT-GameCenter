#include "TargetConditionals.h"

#ifndef BUILDMAC
/* building inside GameMaker most likely? */
#define BUILDMAC 0
#endif

/* build for osx only if BUILDMAC=1 is defined specifically in XCode, or if NOT building for osx. */
/* this is to workaround a bug in GMAssetCompiler where it copies .mm and .h files from iOS into macOS */
#if (TARGET_OS_OSX && BUILDMAC) || !TARGET_OS_OSX

#import "GameCenter.h"

#if TARGET_OS_OSX
#define GMGC_MACOS 1
// enable GameMaker-GameCenter macOS specific code.
#endif

////////////////sigh:
extern
#ifndef GMGC_MACOS
    UIViewController
#else
    NSViewController
#endif
*g_controller;

////////////////macOS specific:

#ifndef GMGC_MACOS
// g_controller is exported by the runner, no need to provide an impl.
// on macOS it is a little different though
// we have to get window_handle() from the game and use GKDialogController instead.
// yeah I know, awful, Apple Moment!
#else
NSViewController* g_controller = nil; // not used in macOS code, see GKDialogController.
NSWindow* g_window = nil;
// a global class variable for macOS calls.
GameCenter* g_GameCenterSingleton = nil;
#endif

////////////////GameMaker interface: macOS implementation is in GameCenterMacOS.cpp
const int EVENT_OTHER_SOCIAL = 70;
// those are not extern C
extern int CreateDsMap( int _num, ... );
extern void CreateAsynEventWithDSMap(int dsmapindex, int event_index);
// but these are... wtf yoyo???
extern "C" void dsMapAddDouble(int _dsMap, const char* _key, double _value);
extern "C" void dsMapAddString(int _dsMap, const char* _key, const char* _value);

@implementation GameCenter

-(id) init {
    self = [super init];
    if (self != nil)
    {
        [[GKLocalPlayer localPlayer] registerListener:self];
        NSLog(@"YYGameCenter: %@", @"Registering GK listener.");
    }
    
    return self;
}
//NOT FOR IOS
// -(double) GameCenter_MacOS_SetWindowHandle:(NSWindow*) ptrgamewindowhandle
// {
// #ifndef GMGC_MACOS
    // // always return success on iOS, no need to init anything...
    // NSLog(@"YYGameCenter: %@", @"No need to call GameCenter_MacOS_SetWindowHandle on iOS");
    // return 1;
// #else
    // NSLog(@"YYGameCenter: %@", @"Trying to obtain window handle from GML");

    // g_window = ptrgamewindowhandle;
    // if (g_window != nil)
    // {
        // NSLog(@"YYGameCenter: %@", @"Got a valid NSWindow pointer:");
        // NSLog(@"YYGameCenter: %@", [g_window title]);
        
        // GKDialogController* dialogController = [GKDialogController sharedDialogController];
        // if (dialogController != nil)
        // {
            // dialogController.parentWindow = g_window;
            // NSLog(@"YYGameCenter: %@", @"Successfully set the window handle!");
            // return 1;
        // }
        // else NSLog(@"YYGameCenter: %@", @"GKDialogController pointer is nil.");
    // }
    // else NSLog(@"YYGameCenter: %@", @"NSWindow pointer is nil.");
    
    // return 0;
// #endif
// }

////////////////GKGameCenterViewController
// https://developer.apple.com/documentation/gamekit/gkgamecenterviewcontroller?language=objc

-(double) GameCenter_PresentView_Default
{
    if (@available(iOS 14.0, macOS 11.0, *)) {
        GKGameCenterViewController *gameCenterController = [[GKGameCenterViewController alloc] initWithState: GKGameCenterViewControllerStateDefault];
        if(gameCenterController == nil)
            return 0;
        
        gameCenterController.gameCenterDelegate = self;
#ifndef GMGC_MACOS
        [g_controller presentViewController: gameCenterController animated: YES completion:nil];
#else
        [[GKDialogController sharedDialogController] presentViewController: gameCenterController];
#endif
    } else {
        GKGameCenterViewController *gameCenterController = [[GKGameCenterViewController alloc] init];
        gameCenterController.gameCenterDelegate = self;
        gameCenterController.viewState = GKGameCenterViewControllerStateDefault;
#ifndef GMGC_MACOS
        [g_controller presentViewController: gameCenterController animated: YES completion:nil];
#else
        [[GKDialogController sharedDialogController] presentViewController: gameCenterController];
#endif
    }
    return 1;
}

-(double) GameCenter_PresentView_Achievements
{
    if (@available(iOS 14.0, macOS 11.0, *)) {
        GKGameCenterViewController *gameCenterController = [[GKGameCenterViewController alloc] initWithState: GKGameCenterViewControllerStateAchievements];
        if(gameCenterController == nil)
            return 0;
        
        gameCenterController.gameCenterDelegate = self;
#ifndef GMGC_MACOS
        [g_controller presentViewController: gameCenterController animated: YES completion:nil];
#else
        [[GKDialogController sharedDialogController] presentViewController: gameCenterController];
#endif
    } else {
        GKGameCenterViewController *gameCenterController = [[GKGameCenterViewController alloc] init];
        gameCenterController.gameCenterDelegate = self;
        gameCenterController.viewState = GKGameCenterViewControllerStateAchievements;
#ifndef GMGC_MACOS
        [g_controller presentViewController: gameCenterController animated: YES completion:nil];
#else
        [[GKDialogController sharedDialogController] presentViewController: gameCenterController];
#endif
    }
    return 1;
}

-(double) GameCenter_PresentView_Achievement:(NSString*) ach_id
{
    if (@available(iOS 14.0, macOS 11.0, *)) {
        GKGameCenterViewController *gameCenterController = [[GKGameCenterViewController alloc] initWithAchievementID: ach_id];
        if(gameCenterController == nil)
            return 0;
        
        gameCenterController.gameCenterDelegate = self;
#ifndef GMGC_MACOS
        [g_controller presentViewController: gameCenterController animated: YES completion:nil];
#else
        [[GKDialogController sharedDialogController] presentViewController: gameCenterController];
#endif
    } else {
        NSLog(@"YYGameCenter: %@", @"GameCenter_PresentView_Achievement No Available Until iOS 14.0 or macOS 11.0");
        return 0;
    }
    return 1;
}

-(double) GameCenter_PresentView_Leaderboards
{
    if (@available(iOS 14.0, macOS 11.0, *)) {
        GKGameCenterViewController *gameCenterController = [[GKGameCenterViewController alloc] initWithState: GKGameCenterViewControllerStateLeaderboards];
        if(gameCenterController == nil)
            return 0;
        
        gameCenterController.gameCenterDelegate = self;
#ifndef GMGC_MACOS
        [g_controller presentViewController: gameCenterController animated: YES completion:nil];
#else
        [[GKDialogController sharedDialogController] presentViewController: gameCenterController];
#endif
    } else {
        GKGameCenterViewController *gameCenterController = [[GKGameCenterViewController alloc] init];
        gameCenterController.gameCenterDelegate = self;
        gameCenterController.viewState = GKGameCenterViewControllerStateLeaderboards;
#ifndef GMGC_MACOS
        [g_controller presentViewController: gameCenterController animated: YES completion:nil];
#else
        [[GKDialogController sharedDialogController] presentViewController: gameCenterController];
#endif
    }
    return 1;
}

-(double) GameCenter_PresentView_Leaderboard:(NSString*) leaderboardId leaderboardTimeScope: (double) leaderboardTimeScope playerScope:(double) playerScope
{
    GKLeaderboardPlayerScope mGKLeaderboardPlayerScope = GKLeaderboardPlayerScopeGlobal;
    switch((int) leaderboardTimeScope)
    {
        case 0: mGKLeaderboardPlayerScope = GKLeaderboardPlayerScopeGlobal; break;
        case 1: mGKLeaderboardPlayerScope = GKLeaderboardPlayerScopeFriendsOnly; break;
    }
    
    GKLeaderboardTimeScope mGKLeaderboardTimeScope = GKLeaderboardTimeScopeToday;
    switch((int) playerScope)
    {
        case 0: mGKLeaderboardTimeScope = GKLeaderboardTimeScopeToday; break;
        case 1: mGKLeaderboardTimeScope = GKLeaderboardTimeScopeWeek; break;
        case 2: mGKLeaderboardTimeScope = GKLeaderboardTimeScopeAllTime; break;
    }
    
    if (@available(iOS 14.0, macOS 11.0, *)) {
        GKGameCenterViewController *gameCenterController = [[GKGameCenterViewController alloc] initWithLeaderboardID:leaderboardId playerScope:mGKLeaderboardPlayerScope timeScope:mGKLeaderboardTimeScope];
        if(gameCenterController == nil)
            return 0;
        
        gameCenterController.gameCenterDelegate = self;
        //gameCenterController.viewState = GKGameCenterViewControllerStateLeaderboards;
        
#ifndef GMGC_MACOS
        [g_controller presentViewController: gameCenterController animated: YES completion:nil];
#else
        [[GKDialogController sharedDialogController] presentViewController: gameCenterController];
#endif
    } else {
        GKGameCenterViewController *gameCenterController = [[GKGameCenterViewController alloc] init];
        gameCenterController.gameCenterDelegate = self;
        gameCenterController.viewState = GKGameCenterViewControllerStateLeaderboards;
        
        gameCenterController.leaderboardIdentifier = leaderboardId;
        gameCenterController.leaderboardTimeScope = mGKLeaderboardTimeScope;
        
#ifndef GMGC_MACOS
        [g_controller presentViewController: gameCenterController animated: YES completion:nil];
#else
        [[GKDialogController sharedDialogController] presentViewController: gameCenterController];
#endif
    }
    return 1;
}

////GKGameCenterControllerDelegate
//https://developer.apple.com/documentation/gamekit/gkgamecentercontrollerdelegate?language=objc
-(void) gameCenterViewControllerDidFinish:(GKGameCenterViewController *)gameCenterViewController;
{
    int dsMapIndex = CreateDsMap(0);
    dsMapAddString(dsMapIndex, "type", "GameCenter_PresentView_DidFinish");
    
    if (gameCenterViewController != nil)
    {
#ifndef GMGC_MACOS
        [g_controller dismissViewControllerAnimated:YES completion:nil];
#else
        [[GKDialogController sharedDialogController] dismiss: self];
#endif

        dsMapAddDouble(dsMapIndex, "success", 1);
    }
    else
    {
        NSLog(@"YYGameCenter: %@", @"gameCenterViewControllerDidFinish controller is nil");
        dsMapAddDouble(dsMapIndex, "success", 0);
    }
    
    CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
}

////////////// GKLocalPlayer
//https://developer.apple.com/documentation/gamekit/gklocalplayer?language=objc
-(double) GameCenter_LocalPlayer_Authenticate
{
    [GKLocalPlayer localPlayer].authenticateHandler = ^(
#ifndef GMGC_MACOS
        UIViewController
#else
        NSViewController
#endif
        * viewController,
        NSError *error)
    {
        GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
        int dsMapIndex = CreateDsMap(0);
        
        dsMapAddString(dsMapIndex, "type", "GameCenter_Authenticate");
        
        // authentication stages:
        if(viewController != nil) // stage 1: presenting the view controller, sometimes it can jump straight to stage 2.
        {
#ifndef GMGC_MACOS
            [g_controller presentViewController: viewController animated:YES completion: NULL];
#else
            NSLog(@"YYGameCenter: %@", [viewController className]);
            [[GKDialogController sharedDialogController] presentViewController: (NSViewController<GKViewController>*)viewController];
#endif
            dsMapAddString(dsMapIndex, "authentication_state", "presenting_view");
        }
        else if (localPlayer.isAuthenticated) // stage 2: we're in!
        {
            dsMapAddString(dsMapIndex, "authentication_state", "authenticated");
        }
        else // something is wrong, viewcontroller is nil, but we are not authenticated?
        {
            dsMapAddString(dsMapIndex, "authentication_state", "unknown");
        }
        
        if (error != nil)
        {
            dsMapAddDouble(dsMapIndex, "success", 0);
            dsMapAddDouble(dsMapIndex, "error_code", [error code]);
            dsMapAddString(dsMapIndex, "error_message", (char*)[[error localizedDescription] UTF8String]);
        }
        else dsMapAddDouble(dsMapIndex, "success", 1);
        
        CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
    };
    
    return 1;
}

//GameCenter_GKLocalPlayer_generateIdentityVerificationSignatureWithCompletionHandler()////NO YET
-(double) GameCenter_LocalPlayer_IsAuthenticated
{
    GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
    if(localPlayer.isAuthenticated)
        return 1;
    else
        return 0;
}

-(double) GameCenter_LocalPlayer_IsUnderage
{
    GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
    if(localPlayer.isUnderage)
        return 1;
    else
        return 0;
}

-(double) GameCenter_LocalPlayer_IsMultiplayerGamingRestricted
{
    if (@available(iOS 13.0, macOS 10.15, *)) {
        GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
        if(localPlayer.isMultiplayerGamingRestricted)
            return 1;
        else
            return 0;
    }
    else {
        NSLog(@"YYGameCenter: %@", @"GameCenter_LocalPlayer_IsMultiplayerGamingRestricted No Available Until iOS 13.0 or macOS 10.15");
        return 0;
    }
}

-(double) GameCenter_LocalPlayer_IsPersonalizedCommunicationRestricted
{
    if (@available(iOS 14.0, macOS 11.0, *)) {
        GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
        if(localPlayer.isPersonalizedCommunicationRestricted)
            return 1;
        else
            return 0;
    }
    else {
        NSLog(@"YYGameCenter: %@", @"GameCenter_LocalPlayer_IsPersonalizedCommunicationRestricted No Available Until iOS 14.0 or macOS 11.0");
        return 0;
    }
}

-(NSString*) GameCenter_LocalPlayer_GetInfo
{
    GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
    return([GameCenter GKPlayerJSON:localPlayer]);
}

-(double) GameCenter_SavedGames_Fetch
{
    GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
    [localPlayer fetchSavedGamesWithCompletionHandler:^(NSArray<GKSavedGame *> * _Nullable savedGames, NSError * _Nullable error)
    {
        NSMutableArray *array = [[NSMutableArray alloc] init];
        if(savedGames != nil)
        for(GKSavedGame *savedGame in savedGames)
            [array addObject:[GameCenter GKSavedGameDic: savedGame]];
        
        int dsMapIndex = CreateDsMap(0);
        dsMapAddString(dsMapIndex,"type","GameCenter_SavedGames_Fetch");
        dsMapAddString(dsMapIndex,"slots",(char*)[[GameCenter toJSON: array] UTF8String]);
        if (error != nil)
        {
            dsMapAddDouble(dsMapIndex, "success", 0);
            dsMapAddDouble(dsMapIndex, "error_code", [error code]);
            dsMapAddString(dsMapIndex, "error_message", (char*)[[error localizedDescription] UTF8String]);
        }
        else dsMapAddDouble(dsMapIndex, "success", 1);
        CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
    }];
    
    return 1;
}

-(double) GameCenter_SavedGames_Save: (NSString*) name data: (NSString*) mNSData
{
    GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
    [localPlayer saveGameData:[mNSData dataUsingEncoding:NSUTF8StringEncoding] withName:name completionHandler:^(GKSavedGame * _Nullable savedGame, NSError * _Nullable error)
    {
        int dsMapIndex = CreateDsMap(0);
        dsMapAddString(dsMapIndex, "type","GameCenter_SavedGames_Save");
        dsMapAddString(dsMapIndex, "name",(char*)[name UTF8String]);
        dsMapAddString(dsMapIndex, "slot",(char*)[[GameCenter GKSavedGameJSON: savedGame]UTF8String]);
        if (error != nil)
        {
            dsMapAddDouble(dsMapIndex, "success", 0);
            dsMapAddDouble(dsMapIndex, "error_code", [error code]);
            dsMapAddString(dsMapIndex, "error_message", (char*)[[error localizedDescription] UTF8String]);
        }
        else dsMapAddDouble(dsMapIndex, "success", 1);
        CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
    }];
    
    return 1;
}

-(double) GameCenter_SavedGames_Delete: (NSString*) name
{
    GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
    [localPlayer deleteSavedGamesWithName:name completionHandler:^(NSError * _Nullable error)
    {
        int dsMapIndex = CreateDsMap(0);
        dsMapAddString(dsMapIndex, "type","GameCenter_SavedGames_Delete");
        dsMapAddString(dsMapIndex, "name",(char*)[name UTF8String]);
        if (error != nil)
        {
            dsMapAddDouble(dsMapIndex, "success", 0);
            dsMapAddDouble(dsMapIndex, "error_code", [error code]);
            dsMapAddString(dsMapIndex, "error_message", (char*)[[error localizedDescription] UTF8String]);
        }
        else dsMapAddDouble(dsMapIndex, "success", 1);
        CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
    }];
    
    return 1;
}

-(double) GameCenter_SavedGames_GetData: (NSString*) name
{
    GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
    [localPlayer fetchSavedGamesWithCompletionHandler:^(NSArray<GKSavedGame *> * _Nullable savedGames, NSError * _Nullable error)
    {
        if (error != nil)
        {
            int dsMapIndex = CreateDsMap(0);
            dsMapAddString(dsMapIndex, "type","GameCenter_SavedGames_GetData");
            dsMapAddString(dsMapIndex, "name",(char*)[name UTF8String]);
            dsMapAddDouble(dsMapIndex, "success", 0);
            dsMapAddDouble(dsMapIndex, "error_code", [error code]);
            dsMapAddString(dsMapIndex, "error_message", (char*)[[error localizedDescription] UTF8String]);
            CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
            return;
        }
                
        for(GKSavedGame *mGKSavedGame in savedGames)
        if([[mGKSavedGame name] isEqualToString:name])
        {
            [mGKSavedGame loadDataWithCompletionHandler:^(NSData * _Nullable data, NSError * _Nullable error)
            {
                int dsMapIndex = CreateDsMap(0);
                dsMapAddString(dsMapIndex, "type","GameCenter_SavedGames_GetData");
                dsMapAddString(dsMapIndex, "name",(char*)[name UTF8String]);
                
                if (error != nil)
                {
                    dsMapAddDouble(dsMapIndex, "success", 0);
                    dsMapAddDouble(dsMapIndex, "error_code", [error code]);
                    dsMapAddString(dsMapIndex, "error_message", (char*)[[error localizedDescription] UTF8String]);
                }
                else dsMapAddDouble(dsMapIndex, "success", 1);
                
                if (data != nil)
                {
                    const void *_Nullable rawData = [data bytes];
                    if(rawData != nil)
                        dsMapAddString(dsMapIndex, "data",(char *)rawData);
                }
                
                CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
            }];
            break;
        }
    }];
    
    return 1;
}


-(double) GameCenter_SavedGames_ResolveConflict:(double) conflict_ind data:(NSString*) data
{
    GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
    [localPlayer resolveConflictingSavedGames:self.ArrayOfConflicts[(int)conflict_ind] withData:[data dataUsingEncoding:NSUTF8StringEncoding] completionHandler:^(NSArray<GKSavedGame *> * _Nullable savedGames, NSError * _Nullable error)
    {
        int dsMapIndex = CreateDsMap(0);
        dsMapAddString(dsMapIndex, "type","GameCenter_SavedGames_ResolveConflict");
        dsMapAddDouble(dsMapIndex, "conflict_ind",conflict_ind);
        if (error != nil)
        {
            dsMapAddDouble(dsMapIndex, "success", 0);
            dsMapAddDouble(dsMapIndex, "error_code", [error code]);
            dsMapAddString(dsMapIndex, "error_message", (char*)[[error localizedDescription] UTF8String]);
        }
        else dsMapAddDouble(dsMapIndex, "success", 1);
        CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
    }];
    
    return 1;
}

///////////GKSavedGameListener
//https://developer.apple.com/documentation/gamekit/gksavedgamelistener?language=objc

- (void)player:(GKPlayer *)player hasConflictingSavedGames:(NSArray<GKSavedGame *> *)savedGames
{
    double conflict_ind = self.ArrayOfConflicts.count;
    [self.ArrayOfConflicts addObject: savedGames];
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for(GKSavedGame *savedGame in savedGames)
        [array addObject:[GameCenter GKSavedGameJSON: savedGame]];
    
    int dsMapIndex = CreateDsMap(0);
    dsMapAddString(dsMapIndex, "type","GameCenter_SavedGames_HasConflict");
    dsMapAddDouble(dsMapIndex, "conflict_ind",conflict_ind);
    dsMapAddString(dsMapIndex, "slots",(char*)[[GameCenter toJSON: array] UTF8String]);
    CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
}

- (void)player:(GKPlayer *)player didModifySavedGame:(GKSavedGame *)savedGame;
{
    int dsMapIndex = CreateDsMap(0);
    dsMapAddString(dsMapIndex, "type", "GameCenter_SavedGames_DidModify");
    dsMapAddString(dsMapIndex, "player", (char*)[[GameCenter GKPlayerJSON:player] UTF8String]);
    dsMapAddString(dsMapIndex, "slot", (char*)[[GameCenter GKSavedGameJSON:savedGame] UTF8String]);
    CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
}

////////////////// GKBasePlayer
//https://developer.apple.com/documentation/gamekit/gkbaseplayer?language=objc
+(NSString*) GKSavedGameJSON: (GKSavedGame*) mGKSavedGame
{
    NSDictionary *dic = [GameCenter GKSavedGameDic: mGKSavedGame];
    return [GameCenter toJSON:dic];
}

+(NSDictionary*) GKSavedGameDic: (GKSavedGame*) mGKSavedGame
{
    NSDictionary *mNSDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                      [mGKSavedGame deviceName], @"deviceName",
                      [NSNumber numberWithDouble:[[mGKSavedGame modificationDate] timeIntervalSince1970]], @"modificationDate",
                      [mGKSavedGame name], @"name",
                      nil];
    
    return mNSDictionary;
}

//GKScore
//https://developer.apple.com/documentation/gamekit/gkscore?language=objc
-(double) GameCenter_Leaderboard_Submit: (NSString*) leaderboardID score: (double) score dcontext: (double) dcontext
{
    if (@available(iOS 14.0, macOS 11.0, *)) {
        [GKLeaderboard submitScore:(NSInteger)score context:(NSUInteger)dcontext player:[GKLocalPlayer localPlayer] leaderboardIDs:@[ leaderboardID ] completionHandler:^(NSError * _Nullable error) {
            int dsMapIndex = CreateDsMap(0);
            dsMapAddString(dsMapIndex, "type", "GameCenter_Leaderboard_Submit");
            if (error != nil)
            {
                dsMapAddDouble(dsMapIndex, "success", 0);
                dsMapAddDouble(dsMapIndex, "error_code", [error code]);
                dsMapAddString(dsMapIndex, "error_message", (char*)[[error localizedDescription] UTF8String]);
            }
            else dsMapAddDouble(dsMapIndex, "success", 1);
            CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
        }];
    }
    else {
        GKScore *mGKScore = [[GKScore alloc] initWithLeaderboardIdentifier:leaderboardID];
        mGKScore.value = (int64_t)score;
        mGKScore.context = (uint64_t)dcontext;
        [GKScore reportScores: @[mGKScore] withCompletionHandler:^(NSError * _Nullable error)
        {

            int dsMapIndex = CreateDsMap(0);
            dsMapAddString(dsMapIndex, "type", "GameCenter_Leaderboard_Submit");
            if (error != nil)
            {
                dsMapAddDouble(dsMapIndex, "success", 0);
                dsMapAddDouble(dsMapIndex, "error_code", [error code]);
                dsMapAddString(dsMapIndex, "error_message", (char*)[[error localizedDescription] UTF8String]);
            }
            else dsMapAddDouble(dsMapIndex, "success", 1);
            CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
        }];
    }
    
    return 1;
}

+(double) Util_NSDateToGMDate:(NSDate*)date {
    // converts NSDate into a number for GameMaker date functions.
    return ( ( ( ( (double) [date timeIntervalSince1970] ) + 0.5 ) / 86400.0 ) + 25569.0 );
}

-(double) GameCenter_Leaderboard_LoadGeneric: (NSString*) leaderboardID timeScope:(double) timeScope rangeStart:(double) rangeStart rangeEnd:(double) rangeEnd playerScope:(double) playerScope {
    if (@available(iOS 14.0, macOS 11.0, *)) {
        double myId = self.LastAsyncOpId++;
        [GKLeaderboard loadLeaderboardsWithIDs:@[ leaderboardID ] completionHandler:^(NSArray<GKLeaderboard*>* _Nullable leaderboards, NSError* _Nullable error) {
            // did not even load basic data about the leaderboard :(
            if (error != nil || leaderboards == nil || [leaderboards count] < 1) {
                int dsMapIndex = CreateDsMap(0);
                dsMapAddString(dsMapIndex, "type", "GameCenter_Leaderboard_Load");
                dsMapAddString(dsMapIndex, "leaderboard_id", (char*)[leaderboardID UTF8String]);
                dsMapAddDouble(dsMapIndex, "id", myId);
                dsMapAddDouble(dsMapIndex, "time_scope", timeScope);
                dsMapAddDouble(dsMapIndex, "range_start", rangeStart);
                dsMapAddDouble(dsMapIndex, "range_end", rangeEnd);
                dsMapAddDouble(dsMapIndex, "player_scope", playerScope);
                dsMapAddString(dsMapIndex, "leaderboard_title", "");
                dsMapAddString(dsMapIndex, "leaderboard_group", "");
                dsMapAddDouble(dsMapIndex, "leaderboard_type", -1);
                dsMapAddDouble(dsMapIndex, "leaderboard_start_date", -1);
                dsMapAddDouble(dsMapIndex, "leaderboard_next_start_date", -1);
                dsMapAddDouble(dsMapIndex, "leaderboard_duration", -1);
                
                if (error != nil) {
                    dsMapAddDouble(dsMapIndex, "success", 0);
                    dsMapAddDouble(dsMapIndex, "error_code", [error code]);
                    dsMapAddString(dsMapIndex, "error_message", (char*)[[error localizedDescription] UTF8String]);
                }
                else dsMapAddDouble(dsMapIndex, "success", 1);
                
                dsMapAddDouble(dsMapIndex, "total_players_count", -1);
                
                /* dummy local player info */
                dsMapAddDouble(dsMapIndex, "local_context", -1);
                dsMapAddDouble(dsMapIndex, "local_date", -1);
                dsMapAddDouble(dsMapIndex, "local_rank", -1);
                dsMapAddDouble(dsMapIndex, "local_score", -1);
                dsMapAddString(dsMapIndex, "local_formatted_score", "");
                dsMapAddString(dsMapIndex, "local_info", "{}");
                
                dsMapAddDouble(dsMapIndex, "entries", 0);
                
                CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
                return;
            }
            
            GKLeaderboardPlayerScope ps = GKLeaderboardPlayerScopeGlobal;
            switch ((int)playerScope) {
                case 0: ps = GKLeaderboardPlayerScopeGlobal; break;
                case 1: ps = GKLeaderboardPlayerScopeFriendsOnly; break;
            }
            
            GKLeaderboardTimeScope ts = GKLeaderboardTimeScopeToday;
            switch ((int)timeScope) {
                case 0: ts = GKLeaderboardTimeScopeToday; break;
                case 1: ts = GKLeaderboardTimeScopeWeek; break;
                case 2: ts = GKLeaderboardTimeScopeAllTime; break;
            }
            
            NSRange r = NSMakeRange((NSUInteger)rangeStart, (NSUInteger)rangeEnd);
            
            GKLeaderboard* lb = [leaderboards objectAtIndex:0];
            [lb loadEntriesForPlayerScope:ps timeScope:ts range:r completionHandler:^(GKLeaderboardEntry* _Nullable_result localPlayerEntry, NSArray<GKLeaderboardEntry*>* _Nullable entries, NSInteger totalPlayerCount, NSError* _Nullable error) {
                int dsMapIndex = CreateDsMap(0);
                dsMapAddString(dsMapIndex, "type", "GameCenter_Leaderboard_Load");
                dsMapAddString(dsMapIndex, "leaderboard_id", (char*)[leaderboardID UTF8String]);
                dsMapAddDouble(dsMapIndex, "id", myId);
                dsMapAddDouble(dsMapIndex, "time_scope", timeScope);
                dsMapAddDouble(dsMapIndex, "range_start", rangeStart);
                dsMapAddDouble(dsMapIndex, "range_end", rangeEnd);
                dsMapAddDouble(dsMapIndex, "player_scope", playerScope);
                dsMapAddString(dsMapIndex, "leaderboard_title", (char*)[[lb title] UTF8String]);
                dsMapAddString(dsMapIndex, "leaderboard_group", (char*)[[lb groupIdentifier] UTF8String]);
                double lbtype = -1;
                switch ([lb type]) {
                    case GKLeaderboardTypeClassic: lbtype = 0; break;
                    case GKLeaderboardTypeRecurring: lbtype = 1; break;
                }
                dsMapAddDouble(dsMapIndex, "leaderboard_type", lbtype);
                dsMapAddDouble(dsMapIndex, "leaderboard_start_date", [GameCenter Util_NSDateToGMDate:[lb startDate]]);
                dsMapAddDouble(dsMapIndex, "leaderboard_next_start_date", [GameCenter Util_NSDateToGMDate:[lb nextStartDate]]);
                dsMapAddDouble(dsMapIndex, "leaderboard_duration", [lb duration]);
                
                if (error != nil) {
                    dsMapAddDouble(dsMapIndex, "success", 0);
                    dsMapAddDouble(dsMapIndex, "error_code", [error code]);
                    dsMapAddString(dsMapIndex, "error_message", (char*)[[error localizedDescription] UTF8String]);
                }
                else dsMapAddDouble(dsMapIndex, "success", 1);
                
                dsMapAddDouble(dsMapIndex, "total_players_count", totalPlayerCount);
                
                if (localPlayerEntry == nil) {
                    dsMapAddDouble(dsMapIndex, "local_context", [localPlayerEntry context]);
                    dsMapAddDouble(dsMapIndex, "local_date", [GameCenter Util_NSDateToGMDate:[localPlayerEntry date]]);
                    dsMapAddDouble(dsMapIndex, "local_rank", [localPlayerEntry rank]);
                    dsMapAddDouble(dsMapIndex, "local_score", [localPlayerEntry score]);
                    dsMapAddString(dsMapIndex, "local_formatted_score", (char*)[[localPlayerEntry formattedScore] UTF8String]);
                    dsMapAddString(dsMapIndex, "local_info", (char*)[[GameCenter GKPlayerJSON:[localPlayerEntry player]] UTF8String]);
                }
                else {
                    /* dummy local player info */
                    dsMapAddDouble(dsMapIndex, "local_context", -1);
                    dsMapAddDouble(dsMapIndex, "local_date", -1);
                    dsMapAddDouble(dsMapIndex, "local_rank", -1);
                    dsMapAddDouble(dsMapIndex, "local_score", -1);
                    dsMapAddString(dsMapIndex, "local_formatted_score", "");
                    dsMapAddString(dsMapIndex, "local_info", "{}");
                }
                
                if (entries == nil || [entries count] < 1) {
                    /* don't even bother with entries... */
                    dsMapAddDouble(dsMapIndex, "entries", 0);
                }
                else {
                    dsMapAddDouble(dsMapIndex, "entries", [entries count]);
                    for (NSUInteger i = 0; i < [entries count]; ++i) {
                        GKLeaderboardEntry* e = [entries objectAtIndex:i];
                        
                        dsMapAddDouble(dsMapIndex, (char*)[[NSString stringWithFormat:@"entry_context_%lu", i] UTF8String], e?[e context]:-1);
                        dsMapAddDouble(dsMapIndex, (char*)[[NSString stringWithFormat:@"entry_date_%lu", i] UTF8String], e?[GameCenter Util_NSDateToGMDate:[e date]]:-1);
                        dsMapAddDouble(dsMapIndex, (char*)[[NSString stringWithFormat:@"entry_rank_%lu", i] UTF8String], e?[e rank]:-1);
                        dsMapAddDouble(dsMapIndex, (char*)[[NSString stringWithFormat:@"entry_score_%lu", i] UTF8String], e?[e score]:-1);
                        dsMapAddString(dsMapIndex, (char*)[[NSString stringWithFormat:@"entry_formatted_score_%lu", i] UTF8String], e?(char*)[[e formattedScore] UTF8String]:"");
                        dsMapAddString(dsMapIndex, (char*)[[NSString stringWithFormat:@"entry_info_%lu", i] UTF8String], e?(char*)[[GameCenter GKPlayerJSON:[e player]] UTF8String]:"{}");
                    }
                    
                }
                
                CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
                /* we're done here */
            }];
        }];
        
        return myId;
    }
    else {
        GKLeaderboard *req = [[GKLeaderboard alloc] init];
        if (req != nil) {
            double myId = self.LastAsyncOpId++;
            
            req.identifier = leaderboardID;
            
            GKLeaderboardPlayerScope ps = GKLeaderboardPlayerScopeGlobal;
            switch ((int)playerScope) {
                case 0: ps = GKLeaderboardPlayerScopeGlobal; break;
                case 1: ps = GKLeaderboardPlayerScopeFriendsOnly; break;
            }
            req.playerScope = ps;
            
            GKLeaderboardTimeScope ts = GKLeaderboardTimeScopeToday;
            switch ((int)timeScope) {
                case 0: ts = GKLeaderboardTimeScopeToday; break;
                case 1: ts = GKLeaderboardTimeScopeWeek; break;
                case 2: ts = GKLeaderboardTimeScopeAllTime; break;
            }
            req.timeScope = ts;
            
            NSRange r = NSMakeRange((NSUInteger)rangeStart, (NSUInteger)rangeEnd);
            req.range = r;
            
            [req loadScoresWithCompletionHandler:^(NSArray<GKScore*>* _Nullable scores, NSError* _Nullable error) {
                int dsMapIndex = CreateDsMap(0);
                dsMapAddString(dsMapIndex, "type", "GameCenter_Leaderboard_Load");
                dsMapAddString(dsMapIndex, "leaderboard_id", (char*)[leaderboardID UTF8String]);
                dsMapAddDouble(dsMapIndex, "id", myId);
                dsMapAddDouble(dsMapIndex, "time_scope", timeScope);
                dsMapAddDouble(dsMapIndex, "range_start", rangeStart);
                dsMapAddDouble(dsMapIndex, "range_end", rangeEnd);
                dsMapAddDouble(dsMapIndex, "player_scope", playerScope);
                dsMapAddString(dsMapIndex, "leaderboard_title", (char*)[[req title] UTF8String]);
                dsMapAddString(dsMapIndex, "leaderboard_group", (char*)[[req groupIdentifier] UTF8String]);
                /* sadly not present in old API */
                dsMapAddDouble(dsMapIndex, "leaderboard_type", -1);
                dsMapAddDouble(dsMapIndex, "leaderboard_start_date", -1);
                dsMapAddDouble(dsMapIndex, "leaderboard_next_start_date", -1);
                dsMapAddDouble(dsMapIndex, "leaderboard_duration", -1);
                
                if (error != nil) {
                    dsMapAddDouble(dsMapIndex, "success", 0);
                    dsMapAddDouble(dsMapIndex, "error_code", [error code]);
                    dsMapAddString(dsMapIndex, "error_message", (char*)[[error localizedDescription] UTF8String]);
                }
                else dsMapAddDouble(dsMapIndex, "success", 1);
                
                dsMapAddDouble(dsMapIndex, "total_players_count", [req maxRange]);
                
                if ([req localPlayerScore] == nil) {
                    /* dummy local player info */
                    dsMapAddDouble(dsMapIndex, "local_context", -1);
                    dsMapAddDouble(dsMapIndex, "local_date", -1);
                    dsMapAddDouble(dsMapIndex, "local_rank", -1);
                    dsMapAddDouble(dsMapIndex, "local_score", -1);
                    dsMapAddString(dsMapIndex, "local_formatted_score", "");
                    dsMapAddString(dsMapIndex, "local_info", "{}");
                }
                else {
                    GKScore* e = [req localPlayerScore];
                    dsMapAddDouble(dsMapIndex, "local_context", [e context]);
                    dsMapAddDouble(dsMapIndex, "local_date", [GameCenter Util_NSDateToGMDate:[e date]]);
                    dsMapAddDouble(dsMapIndex, "local_rank", [e rank]);
                    dsMapAddDouble(dsMapIndex, "local_score", [e value]);
                    dsMapAddString(dsMapIndex, "local_formatted_score", (char*)[[e formattedValue] UTF8String]);
                    dsMapAddString(dsMapIndex, "local_info", (char*)[[GameCenter GKPlayerJSON:[e player]] UTF8String]);
                }
                
                if (scores == nil || [scores count] < 1) {
                    dsMapAddDouble(dsMapIndex, "entries", 0);
                }
                else {
                    dsMapAddDouble(dsMapIndex, "entries", [scores count]);
                    for (NSUInteger i = 0; i < [scores count]; ++i) {
                        GKScore* e = [scores objectAtIndex:i];
                        
                        dsMapAddDouble(dsMapIndex, (char*)[[NSString stringWithFormat:@"entry_context_%lu", i] UTF8String], e?[e context]:-1);
                        dsMapAddDouble(dsMapIndex, (char*)[[NSString stringWithFormat:@"entry_date_%lu", i] UTF8String], e?[GameCenter Util_NSDateToGMDate:[e date]]:-1);
                        dsMapAddDouble(dsMapIndex, (char*)[[NSString stringWithFormat:@"entry_rank_%lu", i] UTF8String], e?[e rank]:-1);
                        dsMapAddDouble(dsMapIndex, (char*)[[NSString stringWithFormat:@"entry_score_%lu", i] UTF8String], e?[e value]:-1);
                        dsMapAddString(dsMapIndex, (char*)[[NSString stringWithFormat:@"entry_formatted_score_%lu", i] UTF8String], e?(char*)[[e formattedValue] UTF8String]:"");
                        dsMapAddString(dsMapIndex, (char*)[[NSString stringWithFormat:@"entry_info_%lu", i] UTF8String], e?(char*)[[GameCenter GKPlayerJSON:[e player]] UTF8String]:"{}");
                    }
                }
                
                CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
            }];
            
            return myId;
        }
        
        return -1;
    }
}

-(double) GameCenter_Leaderboard_LoadGlobal: (NSString*) leaderboardID timeScope:(double) timeScope rangeStart:(double) rangeStart rangeEnd:(double) rangeEnd {
    return [self GameCenter_Leaderboard_LoadGeneric:leaderboardID timeScope:timeScope rangeStart:rangeStart rangeEnd:rangeEnd playerScope:0];
}
-(double) GameCenter_Leaderboard_LoadFriendsOnly: (NSString*) leaderboardID timeScope:(double) timeScope rangeStart:(double) rangeStart rangeEnd:(double) rangeEnd {
    return [self GameCenter_Leaderboard_LoadGeneric:leaderboardID timeScope:timeScope rangeStart:rangeStart rangeEnd:rangeEnd playerScope:1];
}

//GKAchievement
//https://developer.apple.com/documentation/gamekit/gkachievement?language=objc
-(double) GameCenter_Achievement_Report: (NSString*) identifier percentComplete: (double) percent showCompletionBanner:(double) showCompletionBanner
{
    GKAchievement *achievement = [[GKAchievement alloc] initWithIdentifier: identifier];
    achievement.showsCompletionBanner = showCompletionBanner > 0.5;
    
    achievement.percentComplete = (float) percent;
    [GKAchievement reportAchievements:@[achievement] withCompletionHandler:^(NSError *error)
    {
        int dsMapIndex = CreateDsMap(0);
        dsMapAddString(dsMapIndex, "type", "GameCenter_Achievement_Report");
        if (error != nil)
        {
            dsMapAddDouble(dsMapIndex, "success", 0);
            dsMapAddDouble(dsMapIndex, "error_code", [error code]);
            dsMapAddString(dsMapIndex, "error_message", (char*)[[error localizedDescription] UTF8String]);
        }
        else dsMapAddDouble(dsMapIndex, "success", 1);
        CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
    }];
    
    return 1;
}

-(double) GameCenter_Achievement_ResetAll
{
    [GKAchievement resetAchievementsWithCompletionHandler:^(NSError * _Nullable error)
    {
        int dsMapIndex = CreateDsMap(0);
        dsMapAddString(dsMapIndex, "type", "GameCenter_Achievement_ResetAll");
        if (error != nil)
        {
            dsMapAddDouble(dsMapIndex, "success", 0);
            dsMapAddDouble(dsMapIndex, "error_code", [error code]);
            dsMapAddString(dsMapIndex, "error_message", (char*)[[error localizedDescription] UTF8String]);
        }
        else dsMapAddDouble(dsMapIndex, "success", 1);
        CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
        
    }];
    
    return 1;
}

////////////////// GKPlayer
//https://developer.apple.com/documentation/gamekit/gkplayer?language=objc
+(NSString*) GKPlayerJSON: (GKPlayer*) mGKPlayer
{
    NSDictionary *mNSDictionary = nil;
    
    if (@available(iOS 12.4, macOS 10.14.6, *)) {
        mNSDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                         [mGKPlayer alias], @"alias",
                         [mGKPlayer displayName], @"displayName",
                         @"", @"playerID",
                         [mGKPlayer gamePlayerID], @"gamePlayerID",
                         [mGKPlayer teamPlayerID], @"teamPlayerID",
                         nil];
    }
    else {
        mNSDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                         [mGKPlayer alias], @"alias",
                         [mGKPlayer displayName], @"displayName",
                         [mGKPlayer playerID], @"playerID",
                         @"", @"gamePlayerID",
                         @"", @"teamPlayerID",
                         nil];
    }
    
    return [GameCenter toJSON:mNSDictionary];
}

/////////TOOLS

+(NSString*) toJSON:(id) obj
{
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:obj
                                                           options:0//NSJSONWritingPrettyPrinted
                                                             error:&error];
    if(error == nil)
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    else
        return @"{}";
}

-(double) RegisterCallbacks: (NSString*) a1 a2: (NSString*) a2 a3: (NSString*) a3 a4: (NSString*) a4 {
    // does nothing on iOS, the actual implementation is macOS specific.
    NSLog(@"YYGameCenter: %@", @"RegisterCallbacks should never be called on iOS. nik was here.");
    return 1;
}

-(double) GameCenter_AccessPoint_SetActive:(double)dactive {
    if (@available(iOS 14.0, macOS 11.0, *)) {
        [GKAccessPoint shared].active = dactive > 0.5;
        return 1;
    }
    else {
        NSLog(@"YYGameCenter: %@", @"GameCenter_AccessPoint_SetActive No Available Until iOS 14.0 or macOS 11.0");
        return 0;
    }
}

-(double) GameCenter_AccessPoint_GetActive {
    if (@available(iOS 14.0, macOS 11.0, *)) {
        return [GKAccessPoint shared].active == YES;
    }
    else {
        NSLog(@"YYGameCenter: %@", @"GameCenter_AccessPoint_GetActive No Available Until iOS 14.0 or macOS 11.0");
        return 0;
    }
}

-(double) GameCenter_AccessPoint_SetLocation:(double)dlocation {
    if (@available(iOS 14.0, macOS 11.0, *)) {
        GKAccessPointLocation location = GKAccessPointLocationTopLeading;
        
        switch ((int)dlocation) {
            case 0: location = GKAccessPointLocationTopLeading; break;
            case 1: location = GKAccessPointLocationTopTrailing; break;
            case 2: location = GKAccessPointLocationBottomLeading; break;
            case 3: location = GKAccessPointLocationBottomTrailing; break;
        }
        
        [GKAccessPoint shared].location = location;
        return 1;
    }
    else {
        NSLog(@"YYGameCenter: %@", @"GameCenter_AccessPoint_SetLocation No Available Until iOS 14.0 or macOS 11.0");
        return 0;
    }
}

-(double) GameCenter_AccessPoint_GetLocation {
    if (@available(iOS 14.0, macOS 11.0, *)) {
        GKAccessPointLocation location = [GKAccessPoint shared].location;
        
        switch (location) {
            case GKAccessPointLocationTopLeading: return 0;
            case GKAccessPointLocationTopTrailing: return 1;
            case GKAccessPointLocationBottomLeading: return 2;
            case GKAccessPointLocationBottomTrailing: return 3;
        }
        
        /* technically should never happen */
        return -1;
    }
    else {
        NSLog(@"YYGameCenter: %@", @"GameCenter_AccessPoint_GetLocation No Available Until iOS 14.0 or macOS 11.0");
        return 0;
    }
}

-(double) GameCenter_AccessPoint_IsPresentingGameCenter {
    if (@available(iOS 14.0, macOS 11.0, *)) {
        return [GKAccessPoint shared].isPresentingGameCenter == YES;
    }
    else {
        NSLog(@"YYGameCenter: %@", @"GameCenter_AccessPoint_IsPresentingGameCenter No Available Until iOS 14.0 or macOS 11.0");
        return 0;
    }
}

-(double) GameCenter_AccessPoint_IsVisible {
    if (@available(iOS 14.0, macOS 11.0, *)) {
        return [GKAccessPoint shared].visible == YES;
    }
    else {
        NSLog(@"YYGameCenter: %@", @"GameCenter_AccessPoint_IsVisible No Available Until iOS 14.0 or macOS 11.0");
        return 0;
    }
}

-(double) GameCenter_AccessPoint_SetShowHighlights:(double)dshow {
    if (@available(iOS 14.0, macOS 11.0, *)) {
        [GKAccessPoint shared].showHighlights = dshow > 0.5;
        return 1;
    }
    else {
        NSLog(@"YYGameCenter: %@", @"GameCenter_AccessPoint_SetShowHighlights No Available Until iOS 14.0 or macOS 11.0");
        return 0;
    }
}

-(double) GameCenter_AccessPoint_GetShowHighlights {
    if (@available(iOS 14.0, macOS 11.0, *)) {
        return [GKAccessPoint shared].showHighlights == YES;
    }
    else {
        NSLog(@"YYGameCenter: %@", @"GameCenter_AccessPoint_GetShowHighlights No Available Until iOS 14.0 or macOS 11.0");
        return 0;
    }
}

-(double) GameCenter_AccessPoint_GetCoordinate:(double)dcoordid {
    if (@available(iOS 14.0, macOS 11.0, *)) {
        switch ((int)dcoordid) {
            case 0: return [GKAccessPoint shared].frameInScreenCoordinates.origin.x;
            case 1: return [GKAccessPoint shared].frameInScreenCoordinates.origin.y;
            case 2: return [GKAccessPoint shared].frameInScreenCoordinates.size.width;
            case 3: return [GKAccessPoint shared].frameInScreenCoordinates.size.height;
        }
        
        return 0;
    }
    else {
        NSLog(@"YYGameCenter: %@", @"GameCenter_AccessPoint_GetCoordinate No Available Until iOS 14.0 or macOS 11.0");
        return 0;
    }
}

-(double) GameCenter_AccessPoint_PresentWithState:(double)dstate {
    if (@available(iOS 14.0, macOS 11.0, *)) {
        GKGameCenterViewControllerState state = GKGameCenterViewControllerStateDefault;
        
        switch ((int)dstate) {
            case -1: state = GKGameCenterViewControllerStateDefault; break;
            case 0: state = GKGameCenterViewControllerStateLeaderboards; break;
            case 1: state = GKGameCenterViewControllerStateAchievements; break;
            case 2: state = GKGameCenterViewControllerStateChallenges; break;
            case 3: state = GKGameCenterViewControllerStateLocalPlayerProfile; break;
            case 4: state = GKGameCenterViewControllerStateDashboard; break;
            case 5: state = GKGameCenterViewControllerStateLocalPlayerFriendsList; break;
        }
        
        [[GKAccessPoint shared] triggerAccessPointWithState:state handler:^(void) {
            
        }];
        
        return 1;
    }
    else {
        NSLog(@"YYGameCenter: %@", @"GameCenter_AccessPoint_PresentWithState No Available Until iOS 14.0 or macOS 11.0");
        return 0;
    }
}

-(double) GameCenter_AccessPoint_Present {
    if (@available(iOS 14.0, macOS 11.0, *)) {
        [[GKAccessPoint shared] triggerAccessPointWithHandler:^(void) {
            
        }];
        
        return 1;
    }
    else {
        NSLog(@"YYGameCenter: %@", @"GameCenter_AccessPoint_Present No Available Until iOS 14.0 or macOS 11.0");
        return 0;
    }
}

@end

#ifndef GMGC_MACOS
/* do nothing! */
#else

/* GameCenterMacOS.cpp */
#include <cstddef>
#include <cstdint>
#define  GMExport __attribute__((visibility("default")))

typedef void(*GMCreateAsyncEventWithDSMap_t)(
    int         iDSMapIndex,
    int         iEventSubtype
);

typedef int (*GMCreateDSMap_t)(
    int         iNumElements /* = 0 */,
    ... /*
    const char* pcszNameStringN,
    double      dValueN,
    const char* pcszValueStringN */
);

typedef bool(*GMDSMapAddDouble_t)(
    int         iDSMapIndex,
    const char* pcszKeyString,
    double      dValue
);

typedef bool(*GMDSMapAddString_t)(
    int         iDSMapIndex,
    const char* pcszKeyString,
    const char* pcszValueString
);

const char* ReturnGMString(char** storage, NSString* _Nullable input) {
    if (*storage) {
        free(*storage);
        *storage = NULL;
    }
    
    if (input != nil) {
        const char* inputAsUtf8 = [input UTF8String];
        if (inputAsUtf8) {
            *storage = strdup(inputAsUtf8);
        }
    }
    
    return *storage;
}

GMExport GMCreateAsyncEventWithDSMap_t GMCreateAsyncEventWithDSMap = NULL;
GMExport GMCreateDSMap_t               GMCreateDSMap               = NULL;
GMExport GMDSMapAddDouble_t            GMDSMapAddDouble            = NULL;
GMExport GMDSMapAddString_t            GMDSMapAddString            = NULL;

GMExport extern "C" void RegisterCallbacks(
    GMCreateAsyncEventWithDSMap_t pGMF1,
    GMCreateDSMap_t               pGMF2,
    GMDSMapAddDouble_t            pGMF3,
    GMDSMapAddString_t            pGMF4) {
    /* just assign the function pointers to static variables. */
    /* the actual exported implementation is below */
    GMCreateAsyncEventWithDSMap = pGMF1;
    GMCreateDSMap               = pGMF2;
    GMDSMapAddDouble            = pGMF3;
    GMDSMapAddString            = pGMF4;
    if (g_GameCenterSingleton == nil) {
        g_GameCenterSingleton = [[GameCenter alloc] init];
    }
}

GMExport int CreateDsMap(
    int _num,
    ... /* :) */) {
    /* let's hope this will work correctly... */
    return GMCreateDSMap(_num /* :) */);
}

GMExport void CreateAsynEventWithDSMap(
    int dsmapindex,
    int event_index) {
    GMCreateAsyncEventWithDSMap(dsmapindex, event_index);
}

GMExport extern "C" void dsMapAddDouble(
    int _dsMap,
    const char* _key,
    double _value) {
    GMDSMapAddDouble(_dsMap, _key, _value);
}

GMExport extern "C" void dsMapAddString(
    int _dsMap,
    const char* _key,
    const char* _value
) {
    GMDSMapAddString(_dsMap, _key, _value);
}

GMExport extern "C" double GameCenter_MacOS_SetWindowHandle(void* ptrwindow) {
    return [g_GameCenterSingleton GameCenter_MacOS_SetWindowHandle: (__bridge NSWindow*)(ptrwindow)];
}

GMExport extern "C" double GameCenter_PresentView_Default() {
    return [g_GameCenterSingleton GameCenter_PresentView_Default];
}

GMExport extern "C" double GameCenter_PresentView_Achievements() {
    return [g_GameCenterSingleton GameCenter_PresentView_Achievements];
}

GMExport extern "C" double GameCenter_PresentView_Achievement(const char* achid) {
    return [g_GameCenterSingleton GameCenter_PresentView_Achievement: [NSString stringWithUTF8String:(achid?achid:"")]];
}

GMExport extern "C" double GameCenter_PresentView_Leaderboards() {
    return [g_GameCenterSingleton GameCenter_PresentView_Leaderboards];
}

GMExport extern "C" double GameCenter_PresentView_Leaderboard(const char* leaderboardId, double leaderboardTimeScope, double playerScope) {
    return [g_GameCenterSingleton GameCenter_PresentView_Leaderboard:[NSString stringWithUTF8String:(leaderboardId?leaderboardId:"")] leaderboardTimeScope:leaderboardTimeScope playerScope:playerScope];
}

GMExport extern "C" double GameCenter_LocalPlayer_Authenticate() {
    return [g_GameCenterSingleton GameCenter_LocalPlayer_Authenticate];
}

GMExport extern "C" double GameCenter_LocalPlayer_IsAuthenticated() {
    return [g_GameCenterSingleton GameCenter_LocalPlayer_IsAuthenticated];
}

GMExport extern "C" double GameCenter_LocalPlayer_IsUnderage() {
    return [g_GameCenterSingleton GameCenter_LocalPlayer_IsUnderage];
}

GMExport extern "C" double GameCenter_LocalPlayer_IsMultiplayerGamingRestricted() {
    return [g_GameCenterSingleton GameCenter_LocalPlayer_IsMultiplayerGamingRestricted];
}

GMExport extern "C" double GameCenter_LocalPlayer_IsPersonalizedCommunicationRestricted() {
    return [g_GameCenterSingleton GameCenter_LocalPlayer_IsPersonalizedCommunicationRestricted];
}

GMExport extern "C" const char* GameCenter_LocalPlayer_GetInfo() {
    static char* _Storage = NULL;
    return ReturnGMString(&_Storage, [g_GameCenterSingleton GameCenter_LocalPlayer_GetInfo]);
}

GMExport extern "C" double GameCenter_SavedGames_Fetch() {
    return [g_GameCenterSingleton GameCenter_SavedGames_Fetch];
}

GMExport extern "C" double GameCenter_SavedGames_Save(const char* name, const char* data) {
    return [g_GameCenterSingleton GameCenter_SavedGames_Save:[NSString stringWithUTF8String:(name?name:"")] data:[NSString stringWithUTF8String:(data?data:"")]];
}

GMExport extern "C" double GameCenter_SavedGames_Delete(const char* name) {
    return [g_GameCenterSingleton GameCenter_SavedGames_Delete:[NSString stringWithUTF8String:(name?name:"")]];
}

GMExport extern "C" double GameCenter_SavedGames_GetData(const char* name) {
    return [g_GameCenterSingleton GameCenter_SavedGames_GetData:[NSString stringWithUTF8String:(name?name:"")]];
}

GMExport extern "C" double GameCenter_SavedGames_ResolveConflict(double conflict_ind, const char* data) {
    return [g_GameCenterSingleton GameCenter_SavedGames_ResolveConflict:conflict_ind data:[NSString stringWithUTF8String:(data?data:"")]];
}

GMExport extern "C" double GameCenter_Leaderboard_Submit(const char* leaderboardID, double score, double dcontext) {
    return [g_GameCenterSingleton GameCenter_Leaderboard_Submit:[NSString stringWithUTF8String:(leaderboardID?leaderboardID:"")] score:score dcontext:dcontext];
}

GMExport extern "C" double GameCenter_Leaderboard_LoadGlobal(const char* leaderboardID, double timeScope, double rangeStart, double rangeEnd) {
    return [g_GameCenterSingleton GameCenter_Leaderboard_LoadGlobal: [NSString stringWithUTF8String:(leaderboardID?leaderboardID:"")] timeScope:timeScope rangeStart:rangeStart rangeEnd:rangeEnd];
}

GMExport extern "C" double GameCenter_Leaderboard_LoadFriendsOnly(const char* leaderboardID, double timeScope, double rangeStart, double rangeEnd) {
    return [g_GameCenterSingleton GameCenter_Leaderboard_LoadFriendsOnly: [NSString stringWithUTF8String:(leaderboardID?leaderboardID:"")] timeScope:timeScope rangeStart:rangeStart rangeEnd:rangeEnd];
}

GMExport extern "C" double GameCenter_Achievement_Report(const char* identifier, double percent, double showBanner) {
    return [g_GameCenterSingleton GameCenter_Achievement_Report:[NSString stringWithUTF8String:(identifier?identifier:"")] percentComplete:percent showCompletionBanner:showBanner];
}

GMExport extern "C" double GameCenter_Achievement_ResetAll() {
    return [g_GameCenterSingleton GameCenter_Achievement_ResetAll];
}

GMExport extern "C" double GameCenter_AccessPoint_SetActive(double dactive) {
    return [g_GameCenterSingleton GameCenter_AccessPoint_SetActive:dactive];
}

GMExport extern "C" double GameCenter_AccessPoint_GetActive() {
    return [g_GameCenterSingleton GameCenter_AccessPoint_GetActive];
}

GMExport extern "C" double GameCenter_AccessPoint_SetLocation(double dlocation) {
    return [g_GameCenterSingleton GameCenter_AccessPoint_SetLocation:dlocation];
}

GMExport extern "C" double GameCenter_AccessPoint_GetLocation() {
    return [g_GameCenterSingleton GameCenter_AccessPoint_GetLocation];
}

GMExport extern "C" double GameCenter_AccessPoint_IsPresentingGameCenter() {
    return [g_GameCenterSingleton GameCenter_AccessPoint_IsPresentingGameCenter];
}

GMExport extern "C" double GameCenter_AccessPoint_IsVisible() {
    return [g_GameCenterSingleton GameCenter_AccessPoint_IsVisible];
}

GMExport extern "C" double GameCenter_AccessPoint_SetShowHighlights(double dshow) {
    return [g_GameCenterSingleton GameCenter_AccessPoint_SetShowHighlights:dshow];
}

GMExport extern "C" double GameCenter_AccessPoint_GetShowHighlights() {
    return [g_GameCenterSingleton GameCenter_AccessPoint_GetShowHighlights];
}

GMExport extern "C" double GameCenter_AccessPoint_GetCoordinate(double dcoordid) {
    return [g_GameCenterSingleton GameCenter_AccessPoint_GetCoordinate:dcoordid];
}

GMExport extern "C" double GameCenter_AccessPoint_PresentWithState(double dstate) {
    return [g_GameCenterSingleton GameCenter_AccessPoint_PresentWithState:dstate];
}

GMExport extern "C" double GameCenter_AccessPoint_Present() {
    return [g_GameCenterSingleton GameCenter_AccessPoint_Present];
}

#endif


#endif

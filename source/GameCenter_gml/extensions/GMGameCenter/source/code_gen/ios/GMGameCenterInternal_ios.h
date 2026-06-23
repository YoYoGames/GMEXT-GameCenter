// ##### extgen :: Auto-generated file do not edit!! #####

#pragma once
#import <Foundation/Foundation.h>

#include <cstdint>
#include <string_view>
#include <vector>
#include <array>
#include <optional>
#include "core/GMExtWire.h"

namespace gm_consts
{
}


namespace gm_enums
{
    enum class GameCenterLeaderboardTimeScope : std::int32_t
    {
        Today = 0,
        Week = 1,
        AllTime = 2
    };

    enum class GameCenterLeaderboardPlayerScope : std::int32_t
    {
        Global = 0,
        FriendsOnly = 1
    };

    enum class GameCenterAccessPointLocation : std::int32_t
    {
        TopLeading = 0,
        TopTrailing = 1,
        BottomLeading = 2,
        BottomTrailing = 3
    };

    enum class GameCenterAccessPointCoordinate : std::int32_t
    {
        X = 0,
        Y = 1,
        Width = 2,
        Height = 3
    };

    enum class GameCenterViewState : std::int32_t
    {
        Default = -1,
        Leaderboards = 0,
        Achievements = 1,
        Challenges = 2,
        LocalPlayerProfile = 3,
        Dashboard = 4,
        LocalPlayerFriendsList = 5
    };

}


namespace gm_structs
{

}

namespace gm::wire::codec
{
}

namespace gm::wire::details
{
}

@protocol GMGameCenterInterface <NSObject>
- (void)gamecenter_view_callback_subscribe:(gm::wire::GMFunction)callback;
- (bool)gamecenter_present_view_default;
- (bool)gamecenter_present_view_achievements;
- (bool)gamecenter_present_view_achievement:(std::string_view)achievement_id;
- (bool)gamecenter_present_view_leaderboards;
- (bool)gamecenter_present_view_leaderboard:(std::string_view)leaderboard_id time_scope:(gm_enums::GameCenterLeaderboardTimeScope)time_scope player_scope:(gm_enums::GameCenterLeaderboardPlayerScope)player_scope;
- (void)gamecenter_local_player_authenticate:(gm::wire::GMFunction)callback;
- (bool)gamecenter_local_player_is_authenticated;
- (bool)gamecenter_local_player_is_underage;
- (bool)gamecenter_local_player_is_multiplayer_gaming_restricted;
- (bool)gamecenter_local_player_is_personalized_communication_restricted;
- (gm::wire::DataStream)gamecenter_local_player_get_info;
- (void)gamecenter_saved_games_callback_subscribe:(gm::wire::GMFunction)callback;
- (void)gamecenter_saved_games_fetch:(gm::wire::GMFunction)callback;
- (void)gamecenter_saved_games_save:(std::string_view)name data:(std::string_view)data callback:(gm::wire::GMFunction)callback;
- (void)gamecenter_saved_games_delete:(std::string_view)name callback:(gm::wire::GMFunction)callback;
- (void)gamecenter_saved_games_get_data:(std::string_view)name callback:(gm::wire::GMFunction)callback;
- (void)gamecenter_saved_games_resolve_conflict:(double)conflict_id data:(std::string_view)data callback:(gm::wire::GMFunction)callback;
- (void)gamecenter_leaderboard_submit:(std::string_view)leaderboard_id score:(double)score context:(double)context callback:(gm::wire::GMFunction)callback;
- (void)gamecenter_leaderboard_load:(std::string_view)leaderboard_id time_scope:(gm_enums::GameCenterLeaderboardTimeScope)time_scope range_start:(double)range_start range_count:(double)range_count player_scope:(gm_enums::GameCenterLeaderboardPlayerScope)player_scope callback:(gm::wire::GMFunction)callback;
- (void)gamecenter_achievement_report:(std::string_view)identifier percent_complete:(double)percent_complete show_completion_banner:(bool)show_completion_banner callback:(gm::wire::GMFunction)callback;
- (void)gamecenter_achievement_reset_all:(gm::wire::GMFunction)callback;
- (void)gamecenter_achievement_load:(gm::wire::GMFunction)callback;
- (bool)gamecenter_access_point_set_active:(bool)active;
- (bool)gamecenter_access_point_get_active;
- (bool)gamecenter_access_point_set_location:(gm_enums::GameCenterAccessPointLocation)location;
- (double)gamecenter_access_point_get_location;
- (bool)gamecenter_access_point_is_presenting_game_center;
- (bool)gamecenter_access_point_is_visible;
- (bool)gamecenter_access_point_set_show_highlights:(bool)show;
- (bool)gamecenter_access_point_get_show_highlights;
- (double)gamecenter_access_point_get_coordinate:(gm_enums::GameCenterAccessPointCoordinate)coordinate;
- (bool)gamecenter_access_point_present_with_state:(gm_enums::GameCenterViewState)state callback:(gm::wire::GMFunction)callback;
- (bool)gamecenter_access_point_present:(gm::wire::GMFunction)callback;
@end


@interface GMGameCenterInternal : NSObject
- (double)__EXT_NATIVE__gamecenter_view_callback_subscribe:(char*)__arg_buffer arg1:(double)__arg_buffer_length;
- (double)__EXT_NATIVE__gamecenter_present_view_default;
- (double)__EXT_NATIVE__gamecenter_present_view_achievements;
- (double)__EXT_NATIVE__gamecenter_present_view_achievement:(char*)achievement_id;
- (double)__EXT_NATIVE__gamecenter_present_view_leaderboards;
- (double)__EXT_NATIVE__gamecenter_present_view_leaderboard:(char*)__arg_buffer arg1:(double)__arg_buffer_length;
- (double)__EXT_NATIVE__gamecenter_local_player_authenticate:(char*)__arg_buffer arg1:(double)__arg_buffer_length;
- (double)__EXT_NATIVE__gamecenter_local_player_is_authenticated;
- (double)__EXT_NATIVE__gamecenter_local_player_is_underage;
- (double)__EXT_NATIVE__gamecenter_local_player_is_multiplayer_gaming_restricted;
- (double)__EXT_NATIVE__gamecenter_local_player_is_personalized_communication_restricted;
- (double)__EXT_NATIVE__gamecenter_local_player_get_info:(char*)__ret_buffer arg1:(double)__ret_buffer_length;
- (double)__EXT_NATIVE__gamecenter_saved_games_callback_subscribe:(char*)__arg_buffer arg1:(double)__arg_buffer_length;
- (double)__EXT_NATIVE__gamecenter_saved_games_fetch:(char*)__arg_buffer arg1:(double)__arg_buffer_length;
- (double)__EXT_NATIVE__gamecenter_saved_games_save:(char*)__arg_buffer arg1:(double)__arg_buffer_length;
- (double)__EXT_NATIVE__gamecenter_saved_games_delete:(char*)__arg_buffer arg1:(double)__arg_buffer_length;
- (double)__EXT_NATIVE__gamecenter_saved_games_get_data:(char*)__arg_buffer arg1:(double)__arg_buffer_length;
- (double)__EXT_NATIVE__gamecenter_saved_games_resolve_conflict:(char*)__arg_buffer arg1:(double)__arg_buffer_length;
- (double)__EXT_NATIVE__gamecenter_leaderboard_submit:(char*)__arg_buffer arg1:(double)__arg_buffer_length;
- (double)__EXT_NATIVE__gamecenter_leaderboard_load:(char*)__arg_buffer arg1:(double)__arg_buffer_length;
- (double)__EXT_NATIVE__gamecenter_achievement_report:(char*)__arg_buffer arg1:(double)__arg_buffer_length;
- (double)__EXT_NATIVE__gamecenter_achievement_reset_all:(char*)__arg_buffer arg1:(double)__arg_buffer_length;
- (double)__EXT_NATIVE__gamecenter_achievement_load:(char*)__arg_buffer arg1:(double)__arg_buffer_length;
- (double)__EXT_NATIVE__gamecenter_access_point_set_active:(double)active;
- (double)__EXT_NATIVE__gamecenter_access_point_get_active;
- (double)__EXT_NATIVE__gamecenter_access_point_set_location:(char*)__arg_buffer arg1:(double)__arg_buffer_length;
- (double)__EXT_NATIVE__gamecenter_access_point_get_location;
- (double)__EXT_NATIVE__gamecenter_access_point_is_presenting_game_center;
- (double)__EXT_NATIVE__gamecenter_access_point_is_visible;
- (double)__EXT_NATIVE__gamecenter_access_point_set_show_highlights:(double)show;
- (double)__EXT_NATIVE__gamecenter_access_point_get_show_highlights;
- (double)__EXT_NATIVE__gamecenter_access_point_get_coordinate:(char*)__arg_buffer arg1:(double)__arg_buffer_length;
- (double)__EXT_NATIVE__gamecenter_access_point_present_with_state:(char*)__arg_buffer arg1:(double)__arg_buffer_length;
- (double)__EXT_NATIVE__gamecenter_access_point_present:(char*)__arg_buffer arg1:(double)__arg_buffer_length;
- (double)__EXT_NATIVE__GMGameCenter_invocation_handler:(char*)__ret_buffer arg1:(double)__ret_buffer_length;
@end



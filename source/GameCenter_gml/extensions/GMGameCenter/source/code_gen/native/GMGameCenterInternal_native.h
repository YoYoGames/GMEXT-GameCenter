// ##### extgen :: Auto-generated file do not edit!! #####

#pragma once
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

void gamecenter_view_callback_subscribe(const gm::wire::GMFunction& callback);
bool gamecenter_present_view_default();
bool gamecenter_present_view_achievements();
bool gamecenter_present_view_achievement(std::string_view achievement_id);
bool gamecenter_present_view_leaderboards();
bool gamecenter_present_view_leaderboard(std::string_view leaderboard_id, gm_enums::GameCenterLeaderboardTimeScope time_scope, gm_enums::GameCenterLeaderboardPlayerScope player_scope);
void gamecenter_local_player_authenticate(const gm::wire::GMFunction& callback);
bool gamecenter_local_player_is_authenticated();
bool gamecenter_local_player_is_underage();
bool gamecenter_local_player_is_multiplayer_gaming_restricted();
bool gamecenter_local_player_is_personalized_communication_restricted();
gm::wire::DataStream gamecenter_local_player_get_info();
void gamecenter_saved_games_callback_subscribe(const gm::wire::GMFunction& callback);
void gamecenter_saved_games_fetch(const gm::wire::GMFunction& callback);
void gamecenter_saved_games_save(std::string_view name, std::string_view data, const gm::wire::GMFunction& callback);
void gamecenter_saved_games_delete(std::string_view name, const gm::wire::GMFunction& callback);
void gamecenter_saved_games_get_data(std::string_view name, const gm::wire::GMFunction& callback);
void gamecenter_saved_games_resolve_conflict(double conflict_id, std::string_view data, const gm::wire::GMFunction& callback);
void gamecenter_leaderboard_submit(std::string_view leaderboard_id, double score, double context, const gm::wire::GMFunction& callback);
void gamecenter_leaderboard_load(std::string_view leaderboard_id, gm_enums::GameCenterLeaderboardTimeScope time_scope, double range_start, double range_count, gm_enums::GameCenterLeaderboardPlayerScope player_scope, const gm::wire::GMFunction& callback);
void gamecenter_achievement_report(std::string_view identifier, double percent_complete, bool show_completion_banner, const gm::wire::GMFunction& callback);
void gamecenter_achievement_reset_all(const gm::wire::GMFunction& callback);
void gamecenter_achievement_load(const gm::wire::GMFunction& callback);
bool gamecenter_access_point_set_active(bool active);
bool gamecenter_access_point_get_active();
bool gamecenter_access_point_set_location(gm_enums::GameCenterAccessPointLocation location);
double gamecenter_access_point_get_location();
bool gamecenter_access_point_is_presenting_game_center();
bool gamecenter_access_point_is_visible();
bool gamecenter_access_point_set_show_highlights(bool show);
bool gamecenter_access_point_get_show_highlights();
double gamecenter_access_point_get_coordinate(gm_enums::GameCenterAccessPointCoordinate coordinate);
bool gamecenter_access_point_present_with_state(gm_enums::GameCenterViewState state, const gm::wire::GMFunction& callback);
bool gamecenter_access_point_present(const gm::wire::GMFunction& callback);

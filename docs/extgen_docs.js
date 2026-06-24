/**
 * @function_partial gamecenter_view_callback_subscribe
 * @param {Function} callback
 * @function_end 
 */

/**
 * @function_partial gamecenter_present_view_default
 * @returns {Bool} 
 * @function_end 
 */

/**
 * @function_partial gamecenter_present_view_achievements
 * @returns {Bool} 
 * @function_end 
 */

/**
 * @function_partial gamecenter_present_view_achievement
 * @param {String} achievement_id
 * @returns {Bool} 
 * @function_end 
 */

/**
 * @function_partial gamecenter_present_view_leaderboards
 * @returns {Bool} 
 * @function_end 
 */

/**
 * @function_partial gamecenter_present_view_leaderboard
 * @param {String} leaderboard_id
 * @param {Enum.GameCenterLeaderboardTimeScope} time_scope
 * @param {Enum.GameCenterLeaderboardPlayerScope} player_scope
 * @returns {Bool} 
 * @function_end 
 */

/**
 * @function_partial gamecenter_local_player_authenticate
 * @param {Function} callback
 * @function_end 
 */

/**
 * @function_partial gamecenter_local_player_is_authenticated
 * @returns {Bool} 
 * @function_end 
 */

/**
 * @function_partial gamecenter_local_player_is_underage
 * @returns {Bool} 
 * @function_end 
 */

/**
 * @function_partial gamecenter_local_player_is_multiplayer_gaming_restricted
 * @returns {Bool} 
 * @function_end 
 */

/**
 * @function_partial gamecenter_local_player_is_personalized_communication_restricted
 * @returns {Bool} 
 * @function_end 
 */

/**
 * @function_partial gamecenter_local_player_get_info
 * @returns {Struct.GameCenterPlayer} 
 * @function_end 
 */

/**
 * @function_partial gamecenter_saved_games_callback_subscribe
 * @param {Function} callback
 * @function_end 
 */

/**
 * @function_partial gamecenter_saved_games_fetch
 * @param {Function} callback
 * @function_end 
 */

/**
 * @function_partial gamecenter_saved_games_save
 * @param {String} name
 * @param {String} data
 * @param {Function} callback
 * @function_end 
 */

/**
 * @function_partial gamecenter_saved_games_delete
 * @param {String} name
 * @param {Function} callback
 * @function_end 
 */

/**
 * @function_partial gamecenter_saved_games_get_data
 * @param {String} name
 * @param {Function} callback
 * @function_end 
 */

/**
 * @function_partial gamecenter_saved_games_resolve_conflict
 * @param {Real} conflict_id
 * @param {String} data
 * @param {Function} callback
 * @function_end 
 */

/**
 * @function_partial gamecenter_leaderboard_submit
 * @param {String} leaderboard_id
 * @param {Real} score
 * @param {Real} context
 * @param {Function} callback
 * @function_end 
 */

/**
 * @function_partial gamecenter_leaderboard_load
 * @param {String} leaderboard_id
 * @param {Enum.GameCenterLeaderboardTimeScope} time_scope
 * @param {Real} range_start
 * @param {Real} range_count
 * @param {Enum.GameCenterLeaderboardPlayerScope} player_scope
 * @param {Function} callback
 * @function_end 
 */

/**
 * @function_partial gamecenter_achievement_report
 * @param {String} identifier
 * @param {Real} percent_complete
 * @param {Bool} show_completion_banner
 * @param {Function} callback
 * @function_end 
 */

/**
 * @function_partial gamecenter_achievement_reset_all
 * @param {Function} callback
 * @function_end 
 */

/**
 * @function_partial gamecenter_achievement_load
 * @param {Function} callback
 * @function_end 
 */

/**
 * @function_partial gamecenter_access_point_set_active
 * @param {Bool} active
 * @returns {Bool} 
 * @function_end 
 */

/**
 * @function_partial gamecenter_access_point_get_active
 * @returns {Bool} 
 * @function_end 
 */

/**
 * @function_partial gamecenter_access_point_set_location
 * @param {Enum.GameCenterAccessPointLocation} location
 * @returns {Bool} 
 * @function_end 
 */

/**
 * @function_partial gamecenter_access_point_get_location
 * @returns {Real} 
 * @function_end 
 */

/**
 * @function_partial gamecenter_access_point_is_presenting_game_center
 * @returns {Bool} 
 * @function_end 
 */

/**
 * @function_partial gamecenter_access_point_is_visible
 * @returns {Bool} 
 * @function_end 
 */

/**
 * @function_partial gamecenter_access_point_set_show_highlights
 * @param {Bool} show
 * @returns {Bool} 
 * @function_end 
 */

/**
 * @function_partial gamecenter_access_point_get_show_highlights
 * @returns {Bool} 
 * @function_end 
 */

/**
 * @function_partial gamecenter_access_point_get_coordinate
 * @param {Enum.GameCenterAccessPointCoordinate} coordinate
 * @returns {Real} 
 * @function_end 
 */

/**
 * @function_partial gamecenter_access_point_present_with_state
 * @param {Enum.GameCenterViewState} state
 * @param {Function} callback
 * @returns {Bool} 
 * @function_end 
 */

/**
 * @function_partial gamecenter_access_point_present
 * @param {Function} callback
 * @returns {Bool} 
 * @function_end 
 */

/**
 * @struct_partial GameCenterPlayer
 * @member {String} alias
 * @member {String} display_name
 * @member {String} player_id
 * @member {String} game_player_id
 * @member {String} team_player_id
 * @struct_end 
 */

/**
 * @struct_partial GameCenterSavedGame
 * @member {String} device_name
 * @member {Real} modification_date
 * @member {String} name
 * @struct_end 
 */

/**
 * @struct_partial GameCenterViewResult
 * @member {Bool} success
 * @struct_end 
 */

/**
 * @struct_partial GameCenterSavedGamesDeleteResult
 * @member {Bool} success
 * @member {Real} error_code
 * @member {String} error_message
 * @member {String} name
 * @struct_end 
 */

/**
 * @struct_partial GameCenterSavedGamesDataResult
 * @member {Bool} success
 * @member {Real} error_code
 * @member {String} error_message
 * @member {String} name
 * @member {String} data
 * @struct_end 
 */

/**
 * @struct_partial GameCenterLeaderboardSubmitResult
 * @member {Bool} success
 * @member {Real} error_code
 * @member {String} error_message
 * @member {String} leaderboard_id
 * @member {Real} score
 * @member {Real} context
 * @struct_end 
 */

/**
 * @struct_partial GameCenterAchievementReportResult
 * @member {Bool} success
 * @member {Real} error_code
 * @member {String} error_message
 * @member {String} identifier
 * @member {Real} percent_complete
 * @struct_end 
 */

/**
 * @struct_partial GameCenterAchievementResetResult
 * @member {Bool} success
 * @member {Real} error_code
 * @member {String} error_message
 * @struct_end 
 */

/**
 * @struct_partial GameCenterLeaderboardEntry
 * @member {Real} context
 * @member {Real} date
 * @member {Real} rank
 * @member {Real} score
 * @member {String} formatted_score
 * @member {Struct.GameCenterPlayer} player
 * @struct_end 
 */

/**
 * @struct_partial GameCenterAchievement
 * @member {String} identifier
 * @member {Real} percent_complete
 * @member {Bool} is_completed
 * @member {Bool} shows_completion_banner
 * @member {Struct.GameCenterPlayer} player
 * @member {Real} last_reported_date
 * @struct_end 
 */

/**
 * @struct_partial GameCenterAuthResult
 * @member {Bool} success
 * @member {Real} error_code
 * @member {String} error_message
 * @member {String} authentication_state
 * @member {Bool} authenticated
 * @member {Struct.GameCenterPlayer} player
 * @struct_end 
 */

/**
 * @struct_partial GameCenterSavedGamesFetchResult
 * @member {Bool} success
 * @member {Real} error_code
 * @member {String} error_message
 * @member {Array[Struct.GameCenterSavedGame]} slots
 * @struct_end 
 */

/**
 * @struct_partial GameCenterSavedGamesSaveResult
 * @member {Bool} success
 * @member {Real} error_code
 * @member {String} error_message
 * @member {String} name
 * @member {Struct.GameCenterSavedGame} slot
 * @struct_end 
 */

/**
 * @struct_partial GameCenterSavedGamesResolveResult
 * @member {Bool} success
 * @member {Real} error_code
 * @member {String} error_message
 * @member {Real} conflict_id
 * @member {Array[Struct.GameCenterSavedGame]} slots
 * @struct_end 
 */

/**
 * @struct_partial GameCenterSavedGamesEvent
 * @member {String} type
 * @member {Real} conflict_id
 * @member {Struct.GameCenterPlayer} player
 * @member {Struct.GameCenterSavedGame} slot
 * @member {Array[Struct.GameCenterSavedGame]} slots
 * @struct_end 
 */

/**
 * @struct_partial GameCenterLeaderboardLoadResult
 * @member {Bool} success
 * @member {Real} error_code
 * @member {String} error_message
 * @member {String} leaderboard_id
 * @member {Real} time_scope
 * @member {Real} range_start
 * @member {Real} range_count
 * @member {Real} player_scope
 * @member {String} leaderboard_title
 * @member {String} leaderboard_group
 * @member {Real} leaderboard_type
 * @member {Real} leaderboard_start_date
 * @member {Real} leaderboard_next_start_date
 * @member {Real} leaderboard_duration
 * @member {Real} total_players_count
 * @member {Struct.GameCenterLeaderboardEntry} local_entry
 * @member {Array[Struct.GameCenterLeaderboardEntry]} entries
 * @struct_end 
 */

/**
 * @struct_partial GameCenterAchievementsResult
 * @member {Bool} success
 * @member {Real} error_code
 * @member {String} error_message
 * @member {Array[Struct.GameCenterAchievement]} achievements
 * @struct_end 
 */

/**
 * @enum_partial GameCenterLeaderboardTimeScope
 * @member Today
 * @member Week
 * @member AllTime
 * @enum_end 
 */

/**
 * @enum_partial GameCenterLeaderboardPlayerScope
 * @member Global
 * @member FriendsOnly
 * @enum_end 
 */

/**
 * @enum_partial GameCenterAccessPointLocation
 * @member TopLeading
 * @member TopTrailing
 * @member BottomLeading
 * @member BottomTrailing
 * @enum_end 
 */

/**
 * @enum_partial GameCenterAccessPointCoordinate
 * @member X
 * @member Y
 * @member Width
 * @member Height
 * @enum_end 
 */

/**
 * @enum_partial GameCenterViewState
 * @member Default
 * @member Leaderboards
 * @member Achievements
 * @member Challenges
 * @member LocalPlayerProfile
 * @member Dashboard
 * @member LocalPlayerFriendsList
 * @enum_end 
 */

/**
 * @const_partial macros
 * @const_end 
 */


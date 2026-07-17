
// FUNCTIONS

/**
 * @function gamecenter_view_callback_subscribe
 * @desc This function registers the callback that is triggered whenever a presented Game Center view is dismissed. The callback is called with no arguments — it is a pure dismissal notification.
 *
 * You subscribe once (for example at startup) and then call ${function.gamecenter_present_view_achievement} / ${function.gamecenter_present_view_leaderboard} to bring up the native Game Center overlay UI for a specific achievement or leaderboard.
 *
 * [[Note: For the general (non-per-ID) Game Center dashboard/achievements/leaderboards views, use ${module.accesspoint}'s ${function.gamecenter_access_point_present_with_state} instead, which takes its own per-call callback and does not use this subscription.]]
 *
 * @param {Function} callback The function to call each time a presented Game Center view is dismissed
 *
 * @event callback
 * @desc This callback is triggered when a presented Game Center view is dismissed. It carries no data, so it is called with no arguments.
 * @event_end
 *
 * @example
 * ```gml
 * gamecenter_view_callback_subscribe(function() {
 *     show_debug_message("Game Center view closed.");
 * });
 *
 * gamecenter_present_view_achievement("com.company.game.achievement.first_win");
 * ```
 * This code subscribes to the Game Center view callback and then presents the detail view for a specific achievement.
 * @function_end
 */

/**
 * @function gamecenter_present_view_achievement
 * @desc This function presents the native Game Center detail view for a single achievement, identified by the given achievement identifier string.
 *
 * The dismissal is delivered to the callback registered with ${function.gamecenter_view_callback_subscribe}.
 *
 * [[Important: This function relies on `GKGameCenterViewController`, which Apple deprecated as a whole class in iOS/macOS 26.0. It is kept because `GKAccessPoint` (the non-deprecated replacement used elsewhere in this module) has no equivalent for deep-linking a specific achievement by ID — this is the only way Apple currently documents for that. Revisit if Apple ships a replacement.]]
 *
 * @param {String} achievement_id The identifier of the achievement whose detail view should be opened
 *
 * @returns {Bool} Returns `true` if the view was presented, or `false` if it could not be (for example, the OS is too old for the requested view).
 *
 * @example
 * ```gml
 * gamecenter_present_view_achievement("com.company.game.achievement.first_win");
 * ```
 * This code presents the detail view for the given achievement.
 * @function_end
 */

/**
 * @function gamecenter_present_view_leaderboard
 * @desc This function presents the native Game Center detail view for a single leaderboard, identified by the given leaderboard identifier string, filtered by the given time and player scopes.
 *
 * The dismissal is delivered to the callback registered with ${function.gamecenter_view_callback_subscribe}.
 *
 * [[Important: This function relies on `GKGameCenterViewController`, which Apple deprecated as a whole class in iOS/macOS 26.0. It is kept because `GKAccessPoint` (the non-deprecated replacement used elsewhere in this module) has no equivalent for deep-linking a specific leaderboard + time/player scope by ID — this is the only way Apple currently documents for that. Revisit if Apple ships a replacement.]]
 *
 * [[Note: The ${constant.GameCenterLeaderboardTimeScope} and ${constant.GameCenterLeaderboardPlayerScope} enumerations are defined in the Leaderboard module.]]
 *
 * @param {String} leaderboard_id The identifier of the leaderboard whose detail view should be opened
 * @param {Constant.GameCenterLeaderboardTimeScope} time_scope The time scope to filter the leaderboard by
 * @param {Constant.GameCenterLeaderboardPlayerScope} player_scope The player scope to filter the leaderboard by
 *
 * @returns {Bool} Returns `true` if the view was presented, or `false` if it could not be (for example, the OS is too old for the requested view).
 *
 * @example
 * ```gml
 * gamecenter_present_view_leaderboard("com.company.game.leaderboard.high_scores", GameCenterLeaderboardTimeScope.AllTime, GameCenterLeaderboardPlayerScope.Global);
 * ```
 * This code presents the detail view for the given leaderboard, showing all-time global scores.
 * @function_end
 */

// MODULES

/**
 * @module presentview
 * @title Present View
 * @desc This module provides functions to present the native Game Center detail view for a specific achievement or leaderboard, identified by ID. This is an Apple-only extension, supported on **iOS** and **macOS**.
 *
 * You subscribe to the dismissal callback once with ${function.gamecenter_view_callback_subscribe}, then call ${function.gamecenter_present_view_achievement} or ${function.gamecenter_present_view_leaderboard} to bring up a Game Center detail view for a specific ID.
 *
 * [[Note: The general (non-per-ID) Game Center dashboard/achievements/leaderboards views are presented via ${module.accesspoint} instead — see ${function.gamecenter_access_point_present_with_state}.]]
 *
 * [[Note: These functions require iOS 14 / macOS 11 and rely on a Game Center API Apple deprecated in iOS/macOS 26.0 (`GKGameCenterViewController`) — kept because there is no per-ID replacement on `GKAccessPoint`. On unsupported OS versions the present functions return `false`.]]
 *
 * @section_func
 * @desc The following functions are provided to present Game Center detail views:
 * @ref gamecenter_view_callback_subscribe
 * @ref gamecenter_present_view_achievement
 * @ref gamecenter_present_view_leaderboard
 * @section_end
 *
 * @module_end
 */

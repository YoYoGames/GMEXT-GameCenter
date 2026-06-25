
// FUNCTIONS

/**
 * @function gamecenter_view_callback_subscribe
 * @desc This function registers the callback that is triggered whenever a presented Game Center view is dismissed. The callback receives a single ${struct.GameCenterViewResult} struct as its only argument.
 *
 * You typically subscribe once (for example at startup) and then call the various present functions (such as ${function.gamecenter_present_view_default}) to bring up the native Game Center overlay UI.
 *
 * @param {Function} callback The function to call each time a presented Game Center view is dismissed
 *
 * @event callback
 * @desc This callback is triggered when a presented Game Center view is dismissed.
 * @member {Struct.GameCenterViewResult} result A ${struct.GameCenterViewResult} struct describing the dismissal
 * @event_end
 *
 * @example
 * ```gml
 * gamecenter_view_callback_subscribe(function(_result) {
 *     show_debug_message($"Game Center view closed: {_result.success}");
 * });
 *
 * gamecenter_present_view_default();
 * ```
 * This code subscribes to the Game Center view callback and then presents the default Game Center view.
 * @function_end
 */

/**
 * @function gamecenter_present_view_default
 * @desc This function presents the default native Game Center overlay UI, showing general information on achievements and leaderboards.
 *
 * The result of dismissing the view is delivered to the callback registered with ${function.gamecenter_view_callback_subscribe} as a ${struct.GameCenterViewResult}.
 *
 * @returns {Bool} Returns `true` if the view was presented, or `false` if it could not be (for example, the OS is too old for the requested view).
 *
 * @example
 * ```gml
 * gamecenter_present_view_default();
 * ```
 * This code presents the default Game Center view.
 * @function_end
 */

/**
 * @function gamecenter_present_view_achievements
 * @desc This function presents the native Game Center achievements overlay UI.
 *
 * The result of dismissing the view is delivered to the callback registered with ${function.gamecenter_view_callback_subscribe} as a ${struct.GameCenterViewResult}.
 *
 * @returns {Bool} Returns `true` if the view was presented, or `false` if it could not be (for example, the OS is too old for the requested view).
 *
 * @example
 * ```gml
 * gamecenter_present_view_achievements();
 * ```
 * This code presents the Game Center achievements view.
 * @function_end
 */

/**
 * @function gamecenter_present_view_achievement
 * @desc This function presents the native Game Center detail view for a single achievement, identified by the given achievement identifier string.
 *
 * The result of dismissing the view is delivered to the callback registered with ${function.gamecenter_view_callback_subscribe} as a ${struct.GameCenterViewResult}.
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
 * @function gamecenter_present_view_leaderboards
 * @desc This function presents the native Game Center leaderboards overlay UI.
 *
 * The result of dismissing the view is delivered to the callback registered with ${function.gamecenter_view_callback_subscribe} as a ${struct.GameCenterViewResult}.
 *
 * @returns {Bool} Returns `true` if the view was presented, or `false` if it could not be (for example, the OS is too old for the requested view).
 *
 * @example
 * ```gml
 * gamecenter_present_view_leaderboards();
 * ```
 * This code presents the Game Center leaderboards view.
 * @function_end
 */

/**
 * @function gamecenter_present_view_leaderboard
 * @desc This function presents the native Game Center detail view for a single leaderboard, identified by the given leaderboard identifier string, filtered by the given time and player scopes.
 *
 * The result of dismissing the view is delivered to the callback registered with ${function.gamecenter_view_callback_subscribe} as a ${struct.GameCenterViewResult}.
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

// STRUCTS

/**
 * @struct GameCenterViewResult
 * @desc This struct is passed to the callback registered with ${function.gamecenter_view_callback_subscribe} when a presented Game Center view is dismissed.
 *
 * [[Note: GameCenterViewResult.success is currently always `true` on dismissal. It signals that the view closed, not a meaningful success/failure status.]]
 *
 * @member {Bool} success Whether the view was dismissed successfully (currently always `true`)
 * @struct_end
 */

// MODULES

/**
 * @module presentview
 * @title Present View
 * @desc This module provides functions to present the native Game Center overlay UI. This is an Apple-only extension, supported on **iOS** and **macOS**.
 *
 * You subscribe to the dismissal callback once with ${function.gamecenter_view_callback_subscribe}, then call any of the present functions to bring up a Game Center view. When the view is dismissed, the callback receives a ${struct.GameCenterViewResult}.
 *
 * [[Note: The state-based Game Center view controllers used by these functions require iOS 14 / macOS 11. On older systems the present functions return `false`.]]
 *
 * @section_func
 * @desc The following functions are provided to present Game Center views:
 * @ref gamecenter_view_callback_subscribe
 * @ref gamecenter_present_view_default
 * @ref gamecenter_present_view_achievements
 * @ref gamecenter_present_view_achievement
 * @ref gamecenter_present_view_leaderboards
 * @ref gamecenter_present_view_leaderboard
 * @section_end
 *
 * @section_struct
 * @desc The following struct is used by this module:
 * @ref GameCenterViewResult
 * @section_end
 *
 * @module_end
 */

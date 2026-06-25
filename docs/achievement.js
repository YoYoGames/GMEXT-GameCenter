
// FUNCTIONS

/**
 * @function gamecenter_achievement_report
 * @desc This function reports progress for a single achievement to Game Center for the local player.
 *
 * The `identifier` is the achievement ID you configured for the game in App Store Connect. The `percent_complete` is the progress to report, given as a whole-number percentage. When the achievement reaches 100% the `show_completion_banner` argument controls whether Game Center displays its built-in completion banner.
 *
 * [[Note: GameKit requires percent_complete to be an integer in the range 0..100; values are clamped to that range and rounded to a whole number.]]
 * [[Note: This function is only available on the Apple targets (iOS and macOS).]]
 *
 * @param {String} identifier The achievement ID as configured in App Store Connect
 * @param {Real} percent_complete The progress to report, as a whole-number percentage (0..100)
 * @param {Bool} show_completion_banner Whether Game Center shows the built-in completion banner when the achievement reaches 100%
 * @param {Function} callback The function to call once the report attempt finishes
 *
 * @event callback
 * @desc This callback is triggered when the achievement report attempt finishes.
 * @member {Struct.GameCenterAchievementReportResult} result A struct containing the result of the report (see ${struct.GameCenterAchievementReportResult})
 * @event_end
 *
 * @example
 * ```gml
 * gamecenter_achievement_report("ach_first_win", 100, true, function(_result) {
 *     if (_result.success) {
 *         show_debug_message($"Reported {_result.identifier} at {_result.percent_complete}%");
 *     } else {
 *         show_debug_message($"Report failed: {_result.error_message}");
 *     }
 * });
 * ```
 * This code reports an achievement as fully completed and shows the completion banner, outputting the outcome in the callback.
 * @function_end
 */

/**
 * @function gamecenter_achievement_reset_all
 * @desc This function resets ALL of the local player's achievements for the game.
 *
 * [[Note: This operation is irreversible and clears the progress of every achievement for the local player. It is primarily useful during testing.]]
 * [[Note: This function is only available on the Apple targets (iOS and macOS).]]
 *
 * @param {Function} callback The function to call once the reset attempt finishes
 *
 * @event callback
 * @desc This callback is triggered when the reset attempt finishes.
 * @member {Struct.GameCenterAchievementResetResult} result A struct containing the result of the reset (see ${struct.GameCenterAchievementResetResult})
 * @event_end
 *
 * @example
 * ```gml
 * gamecenter_achievement_reset_all(function(_result) {
 *     if (_result.success) {
 *         show_debug_message("All achievements reset");
 *     } else {
 *         show_debug_message($"Reset failed: {_result.error_message}");
 *     }
 * });
 * ```
 * This code resets all of the local player's achievements and outputs the outcome in the callback.
 * @function_end
 */

/**
 * @function gamecenter_achievement_load
 * @desc This function loads all of the local player's achievements, returning their current progress as an array of ${struct.GameCenterAchievement}.
 *
 * [[Note: This function reports the local player's achievement PROGRESS; it does not expose the achievement catalog metadata such as title, description or artwork.]]
 * [[Note: This function is only available on the Apple targets (iOS and macOS).]]
 *
 * @param {Function} callback The function to call once the achievements have loaded
 *
 * @event callback
 * @desc This callback is triggered when the achievements have finished loading.
 * @member {Struct.GameCenterAchievementsResult} result A struct containing the result of the load (see ${struct.GameCenterAchievementsResult})
 * @event_end
 *
 * @example
 * ```gml
 * gamecenter_achievement_load(function(_result) {
 *     if (_result.success) {
 *         array_foreach(_result.achievements, function(_ach) {
 *             show_debug_message($"{_ach.identifier}: {_ach.percent_complete}%");
 *         });
 *     } else {
 *         show_debug_message($"Load failed: {_result.error_message}");
 *     }
 * });
 * ```
 * This code loads the local player's achievements and outputs each one's progress in the callback.
 * @function_end
 */

// STRUCTS

/**
 * @struct GameCenterAchievement
 * @desc This struct represents a single achievement's progress for the local player.
 * @member {String} identifier The achievement ID as configured in App Store Connect
 * @member {Real} percent_complete The current progress as a whole-number percentage (0..100)
 * @member {Bool} is_completed Whether the achievement is completed (`true` at 100%)
 * @member {Bool} shows_completion_banner Whether Game Center shows the built-in completion banner for this achievement
 * @member {Struct.GameCenterPlayer} player The local player this achievement belongs to (see ${struct.GameCenterPlayer})
 * @member {Real} last_reported_date The date the achievement progress was last reported, as a GameMaker datetime
 * @struct_end
 */

/**
 * @struct GameCenterAchievementReportResult
 * @desc This struct contains the result of a ${function.gamecenter_achievement_report} call.
 * @member {Bool} success Whether the report succeeded
 * @member {Real} error_code The error code (only meaningful when `success` is `false`)
 * @member {String} error_message The error message (only meaningful when `success` is `false`)
 * @member {String} identifier The achievement ID that was reported
 * @member {Real} percent_complete The progress that was reported, as a whole-number percentage (0..100)
 * @struct_end
 */

/**
 * @struct GameCenterAchievementResetResult
 * @desc This struct contains the result of a ${function.gamecenter_achievement_reset_all} call.
 * @member {Bool} success Whether the reset succeeded
 * @member {Real} error_code The error code (only meaningful when `success` is `false`)
 * @member {String} error_message The error message (only meaningful when `success` is `false`)
 * @struct_end
 */

/**
 * @struct GameCenterAchievementsResult
 * @desc This struct contains the result of a ${function.gamecenter_achievement_load} call.
 * @member {Bool} success Whether the load succeeded
 * @member {Real} error_code The error code (only meaningful when `success` is `false`)
 * @member {String} error_message The error message (only meaningful when `success` is `false`)
 * @member {Array[Struct.GameCenterAchievement]} achievements The local player's achievements (see ${struct.GameCenterAchievement})
 * @struct_end
 */

// MODULES

/**
 * @module achievement
 * @title Achievement
 * @desc This module provides functions for reporting and loading Game Center achievement progress for the local player on the Apple targets (iOS and macOS).
 *
 * This module reports and loads achievement PROGRESS; it does not expose the achievement catalog metadata (title, description, artwork).
 *
 * @section_func
 * @desc The following functions are provided to work with achievements:
 * @ref gamecenter_achievement_report
 * @ref gamecenter_achievement_reset_all
 * @ref gamecenter_achievement_load
 * @section_end
 *
 * @section_struct
 * @desc The following structs are used by the achievement functions:
 * @ref GameCenterAchievement
 * @ref GameCenterAchievementReportResult
 * @ref GameCenterAchievementResetResult
 * @ref GameCenterAchievementsResult
 * @section_end
 *
 * @module_end
 */


// FUNCTIONS

/**
 * @function gamecenter_leaderboard_submit
 * @desc This function submits a score to a Game Center leaderboard. This is an Apple-only feature (iOS and macOS).
 *
 * Both `score` and `context` are integers.
 *
 * [[Note: GameKit leaderboard scores are integer-only; a fractional `score` or `context` is truncated. For decimal scores configure a formatter in App Store Connect and submit a scaled integer (e.g. score*100).]]
 *
 * @param {String} leaderboard_id The leaderboard's ID as configured in App Store Connect
 * @param {Real} score The score to submit (integer)
 * @param {Real} context An integer value of your choice stored alongside the score
 * @param {Function} callback The function to call when the submission completes
 *
 * @event callback
 * @desc This callback is triggered when the score submission has completed.
 * @member {Struct.GameCenterLeaderboardSubmitResult} result The struct containing the result of the submission
 * @event_end
 *
 * @example
 * ```gml
 * gamecenter_leaderboard_submit("my_leaderboard", 1500, 0, function(_result) {
 *     if (_result.success) {
 *         show_debug_message($"Submitted {_result.score} to {_result.leaderboard_id}");
 *     } else {
 *         show_debug_message($"Submit failed: {_result.error_message}");
 *     }
 * });
 * ```
 * This code submits a score to a leaderboard and outputs the result in a debug message.
 * @function_end
 */

/**
 * @function gamecenter_leaderboard_load
 * @desc This function loads entries from a Game Center leaderboard. This is an Apple-only feature (iOS and macOS).
 *
 * Ranks are 1-based. `range_start` is the first rank to fetch (`>= 1`) and `range_count` is how many entries to fetch.
 *
 * [[Note: GameKit limits a single load to 100 entries — `range_count` is capped to 1..100.]]
 *
 * @param {String} leaderboard_id The leaderboard's ID as configured in App Store Connect
 * @param {Constant.GameCenterLeaderboardTimeScope} time_scope The time scope of the scores to fetch
 * @param {Real} range_start The first rank to fetch (`>= 1`)
 * @param {Real} range_count The number of entries to fetch (1..100)
 * @param {Constant.GameCenterLeaderboardPlayerScope} player_scope Whose scores to fetch
 * @param {Function} callback The function to call when the load completes
 *
 * @event callback
 * @desc This callback is triggered when the leaderboard entries have finished loading.
 * @member {Struct.GameCenterLeaderboardLoadResult} result The struct containing the loaded leaderboard data
 * @event_end
 *
 * @example
 * ```gml
 * gamecenter_leaderboard_load("my_leaderboard", GameCenterLeaderboardTimeScope.AllTime, 1, 10, GameCenterLeaderboardPlayerScope.Global, function(_result) {
 *     if (_result.success) {
 *         show_debug_message($"Total players: {_result.total_players_count}");
 *         array_foreach(_result.entries, function(_entry) {
 *             show_debug_message($"#{_entry.rank}: {_entry.formatted_score} ({_entry.player.display_name})");
 *         });
 *     } else {
 *         show_debug_message($"Load failed: {_result.error_message}");
 *     }
 * });
 * ```
 * This code loads the top 10 all-time global entries from a leaderboard and outputs them in debug messages.
 * @function_end
 */

// STRUCTS

/**
 * @struct GameCenterLeaderboardEntry
 * @desc This struct represents a single entry (a player's score) on a Game Center leaderboard.
 * @member {Real} context The integer context value that was submitted alongside the score
 * @member {Real} date The date and time the score was submitted, as a GameMaker datetime (`-1` if not available)
 * @member {Real} rank The 1-based rank of this entry on the leaderboard
 * @member {Real} score The raw score value
 * @member {String} formatted_score The score formatted according to the leaderboard's formatter in App Store Connect
 * @member {Struct.GameCenterPlayer} player The player this entry belongs to (see ${struct.GameCenterPlayer})
 * @struct_end
 */

/**
 * @struct GameCenterLeaderboardSubmitResult
 * @desc This struct is passed to the callback of ${function.gamecenter_leaderboard_submit} and contains the result of a score submission.
 * @member {Bool} success Whether the submission succeeded
 * @member {Real} error_code The error code (only meaningful when `success` is `false`)
 * @member {String} error_message A human-readable error message (only meaningful when `success` is `false`)
 * @member {String} leaderboard_id The ID of the leaderboard the score was submitted to
 * @member {Real} score The score that was submitted
 * @member {Real} context The context value that was submitted
 * @struct_end
 */

/**
 * @struct GameCenterLeaderboardLoadResult
 * @desc This struct is passed to the callback of ${function.gamecenter_leaderboard_load} and contains the loaded leaderboard data.
 * @member {Bool} success Whether the load succeeded
 * @member {Real} error_code The error code (only meaningful when `success` is `false`)
 * @member {String} error_message A human-readable error message (only meaningful when `success` is `false`)
 * @member {String} leaderboard_id The ID of the leaderboard that was loaded
 * @member {Real} time_scope The time scope that was requested (see ${constant.GameCenterLeaderboardTimeScope})
 * @member {Real} range_start The first rank that was requested
 * @member {Real} range_count The number of entries that was requested
 * @member {Real} player_scope The player scope that was requested (see ${constant.GameCenterLeaderboardPlayerScope})
 * @member {String} leaderboard_title The display title of the leaderboard
 * @member {String} leaderboard_group The group identifier of the leaderboard
 * @member {Real} leaderboard_type The type of the leaderboard
 * @member {Real} leaderboard_start_date The leaderboard's start date as a GameMaker datetime (`-1` if not available)
 * @member {Real} leaderboard_next_start_date The leaderboard's next start date as a GameMaker datetime (`-1` if not available)
 * @member {Real} leaderboard_duration The leaderboard's duration
 * @member {Real} total_players_count The size of the whole leaderboard pool matching the scopes (NOT the number of entries returned)
 * @member {Struct.GameCenterLeaderboardEntry} local_entry The local player's own entry (a `rank` of `-1` means the player has no entry in range)
 * @member {Array[Struct.GameCenterLeaderboardEntry]} entries The array of fetched leaderboard entries
 * @struct_end
 */

// CONSTANTS

/**
 * @const GameCenterLeaderboardTimeScope
 * @desc This enumeration contains the time scopes that can be used when loading a leaderboard.
 * @member Today The leaderboard shows today's scores.
 * @member Week The leaderboard shows this week's scores.
 * @member AllTime The leaderboard shows all-time scores.
 * @const_end
 */

/**
 * @const GameCenterLeaderboardPlayerScope
 * @desc This enumeration contains the player scopes that can be used when loading a leaderboard.
 * @member Global The leaderboard shows scores from all players.
 * @member FriendsOnly The leaderboard shows scores from the local player's friends only.
 * @const_end
 */

// MODULES

/**
 * @module leaderboard
 * @title Leaderboard
 * @section_func
 * @ref gamecenter_leaderboard_submit
 * @ref gamecenter_leaderboard_load
 * @section_end
 *
 * @section_struct
 * @ref GameCenterLeaderboardEntry
 * @ref GameCenterLeaderboardSubmitResult
 * @ref GameCenterLeaderboardLoadResult
 * @section_end
 *
 * @section_const
 * @ref GameCenterLeaderboardTimeScope
 * @ref GameCenterLeaderboardPlayerScope
 * @section_end
 *
 * @module_end
 */

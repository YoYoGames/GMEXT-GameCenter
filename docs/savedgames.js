
// FUNCTIONS

/**
 * @function gamecenter_saved_games_callback_subscribe
 * @desc This function registers a listener for saved-games events. Unlike the other saved-games functions, the callback registered here is not tied to a single call: it fires whenever GameKit reports that a saved game was modified on another device or that a save conflict exists.
 *
 * [[Note: Saved games are an **Apple-only** feature (iOS and macOS) and are stored in the player's iCloud account.]]
 *
 * @param {Function} callback The function to call whenever a saved-games event occurs
 *
 * @event callback
 * @desc This callback is triggered whenever a saved-games event is reported by GameKit.
 * @member {Struct.GameCenterSavedGamesEvent} result A ${struct.GameCenterSavedGamesEvent} struct describing the event
 * @event_end
 *
 * @example
 * ```gml
 * gamecenter_saved_games_callback_subscribe(function(_result) {
 *     if (_result.type == "modified") {
 *         show_debug_message($"Saved game modified: {_result.slot.name}");
 *     } else if (_result.type == "conflict") {
 *         show_debug_message($"Conflict for id: {_result.conflict_id}");
 *     }
 * });
 * ```
 * This code registers a saved-games event listener that reacts to modification and conflict events.
 * @function_end
 */

/**
 * @function gamecenter_saved_games_fetch
 * @desc This function fetches the list of saved games stored in the player's iCloud account. The result is delivered to the callback.
 *
 * @param {Function} callback The function to call with the result of the operation
 *
 * @event callback
 * @desc This callback is triggered when the fetch operation completes.
 * @member {Struct.GameCenterSavedGamesFetchResult} result A ${struct.GameCenterSavedGamesFetchResult} struct containing the fetched saved games
 * @event_end
 *
 * @example
 * ```gml
 * gamecenter_saved_games_fetch(function(_result) {
 *     if (_result.success) {
 *         for (var _i = 0; _i < array_length(_result.slots); _i++) {
 *             show_debug_message(_result.slots[_i].name);
 *         }
 *     }
 * });
 * ```
 * This code fetches all saved games and outputs their names in debug messages.
 * @function_end
 */

/**
 * @function gamecenter_saved_games_save
 * @desc This function saves data to a saved game with the given name. If a slot with `name` already exists it is overwritten, otherwise a new one is created. The result is delivered to the callback.
 *
 * [[Note: The `data` you save is a plain UTF-8 text string. Binary / non-UTF-8 data is not supported by this string-based API.]]
 *
 * @param {String} name The name of the saved game to write
 * @param {String} data The UTF-8 text string to store in the saved game
 * @param {Function} callback The function to call with the result of the operation
 *
 * @event callback
 * @desc This callback is triggered when the save operation completes.
 * @member {Struct.GameCenterSavedGamesSaveResult} result A ${struct.GameCenterSavedGamesSaveResult} struct describing the saved slot
 * @event_end
 *
 * @example
 * ```gml
 * gamecenter_saved_games_save("slot1", "level=5,gold=100", function(_result) {
 *     if (_result.success) {
 *         show_debug_message($"Saved: {_result.name}");
 *     }
 * });
 * ```
 * This code saves a string of game data to a saved game named "slot1".
 * @function_end
 */

/**
 * @function gamecenter_saved_games_delete
 * @desc This function deletes the saved game with the given name. The result is delivered to the callback.
 *
 * @param {String} name The name of the saved game to delete
 * @param {Function} callback The function to call with the result of the operation
 *
 * @event callback
 * @desc This callback is triggered when the delete operation completes.
 * @member {Struct.GameCenterSavedGamesDeleteResult} result A ${struct.GameCenterSavedGamesDeleteResult} struct describing the deleted saved game
 * @event_end
 *
 * @example
 * ```gml
 * gamecenter_saved_games_delete("slot1", function(_result) {
 *     if (_result.success) {
 *         show_debug_message($"Deleted: {_result.name}");
 *     }
 * });
 * ```
 * This code deletes the saved game named "slot1".
 * @function_end
 */

/**
 * @function gamecenter_saved_games_get_data
 * @desc This function retrieves the data stored in the saved game with the given name. The result is delivered to the callback.
 *
 * When several saves share the same name (an unresolved conflict), the most-recently-modified one is returned.
 *
 * [[Note: The returned `data` is a plain UTF-8 text string. If a slot's stored bytes are not valid UTF-8, the result has `success` set to `false` along with an `error_message`.]]
 *
 * @param {String} name The name of the saved game to read
 * @param {Function} callback The function to call with the result of the operation
 *
 * @event callback
 * @desc This callback is triggered when the data has been retrieved.
 * @member {Struct.GameCenterSavedGamesDataResult} result A ${struct.GameCenterSavedGamesDataResult} struct containing the saved game data
 * @event_end
 *
 * @example
 * ```gml
 * gamecenter_saved_games_get_data("slot1", function(_result) {
 *     if (_result.success) {
 *         show_debug_message($"Data: {_result.data}");
 *     }
 * });
 * ```
 * This code reads the data stored in the saved game named "slot1".
 * @function_end
 */

/**
 * @function gamecenter_saved_games_resolve_conflict
 * @desc This function resolves a saved game conflict. Pass the `conflict_id` from a "conflict" ${struct.GameCenterSavedGamesEvent} and the `data` you want to keep for that save name. The result is delivered to the callback.
 *
 * [[Note: The `data` is a plain UTF-8 text string. Binary / non-UTF-8 data is not supported by this string-based API.]]
 *
 * @param {Real} conflict_id The conflict id taken from a "conflict" saved-games event
 * @param {String} data The UTF-8 text string to keep as the resolved saved game
 * @param {Function} callback The function to call with the result of the operation
 *
 * @event callback
 * @desc This callback is triggered when the conflict has been resolved.
 * @member {Struct.GameCenterSavedGamesResolveResult} result A ${struct.GameCenterSavedGamesResolveResult} struct describing the resolved saved games
 * @event_end
 *
 * @example
 * ```gml
 * gamecenter_saved_games_resolve_conflict(_conflict_id, "level=5,gold=100", function(_result) {
 *     if (_result.success) {
 *         show_debug_message($"Resolved conflict: {_result.conflict_id}");
 *     }
 * });
 * ```
 * This code resolves a save conflict, keeping the supplied data for the conflicting save name.
 * @function_end
 */

// STRUCTS

/**
 * @struct GameCenterSavedGame
 * @desc This struct represents a single saved game slot stored in the player's iCloud account.
 * @member {String} device_name The name of the device on which the saved game was created or last modified
 * @member {Real} modification_date The date the saved game was last modified, as a GameMaker datetime
 * @member {String} name The name of the saved game
 * @struct_end
 */

/**
 * @struct GameCenterSavedGamesFetchResult
 * @desc This struct is passed to the callback of ${function.gamecenter_saved_games_fetch}.
 * @member {Bool} success Whether the operation succeeded
 * @member {Real} error_code The error code (only meaningful when `success` is `false`)
 * @member {String} error_message A human-readable error description (only meaningful when `success` is `false`)
 * @member {Array[Struct.GameCenterSavedGame]} slots An array of ${struct.GameCenterSavedGame} structs, one per fetched saved game
 * @struct_end
 */

/**
 * @struct GameCenterSavedGamesSaveResult
 * @desc This struct is passed to the callback of ${function.gamecenter_saved_games_save}.
 * @member {Bool} success Whether the operation succeeded
 * @member {Real} error_code The error code (only meaningful when `success` is `false`)
 * @member {String} error_message A human-readable error description (only meaningful when `success` is `false`)
 * @member {String} name The name of the saved game that was written
 * @member {Struct.GameCenterSavedGame} slot The ${struct.GameCenterSavedGame} struct describing the written saved game
 * @struct_end
 */

/**
 * @struct GameCenterSavedGamesDeleteResult
 * @desc This struct is passed to the callback of ${function.gamecenter_saved_games_delete}.
 * @member {Bool} success Whether the operation succeeded
 * @member {Real} error_code The error code (only meaningful when `success` is `false`)
 * @member {String} error_message A human-readable error description (only meaningful when `success` is `false`)
 * @member {String} name The name of the saved game that was deleted
 * @struct_end
 */

/**
 * @struct GameCenterSavedGamesDataResult
 * @desc This struct is passed to the callback of ${function.gamecenter_saved_games_get_data}.
 * @member {Bool} success Whether the operation succeeded
 * @member {Real} error_code The error code (only meaningful when `success` is `false`)
 * @member {String} error_message A human-readable error description (only meaningful when `success` is `false`)
 * @member {String} name The name of the saved game that was read
 * @member {String} data The UTF-8 text string stored in the saved game
 * @struct_end
 */

/**
 * @struct GameCenterSavedGamesResolveResult
 * @desc This struct is passed to the callback of ${function.gamecenter_saved_games_resolve_conflict}.
 * @member {Bool} success Whether the operation succeeded
 * @member {Real} error_code The error code (only meaningful when `success` is `false`)
 * @member {String} error_message A human-readable error description (only meaningful when `success` is `false`)
 * @member {Real} conflict_id The conflict id that was resolved (echoed from the request)
 * @member {Array[Struct.GameCenterSavedGame]} slots An array of ${struct.GameCenterSavedGame} structs describing the resolved saved games
 * @struct_end
 */

/**
 * @struct GameCenterSavedGamesEvent
 * @desc This struct is passed to the callback registered with ${function.gamecenter_saved_games_callback_subscribe}. The `type` field determines which other fields are set.
 *
 * When `type` is `"modified"`, the `player` and `slot` fields are set (a saved game was changed on another device).
 *
 * When `type` is `"conflict"`, the `conflict_id`, `player` and `slots` fields are set.
 *
 * [[Note: GameKit can report conflicts for several filenames at once; this extension emits one "conflict" event (with its own `conflict_id`) per filename, so each `conflict_id` corresponds to a single save name.]]
 *
 * @member {String} type The event type, either `"conflict"` or `"modified"`
 * @member {Real} conflict_id The conflict id (set when `type` is `"conflict"`), to be passed to ${function.gamecenter_saved_games_resolve_conflict}
 * @member {Struct.GameCenterPlayer} player The ${struct.GameCenterPlayer} associated with the event
 * @member {Struct.GameCenterSavedGame} slot The ${struct.GameCenterSavedGame} that was modified (set when `type` is `"modified"`)
 * @member {Array[Struct.GameCenterSavedGame]} slots An array of conflicting ${struct.GameCenterSavedGame} structs (set when `type` is `"conflict"`)
 * @struct_end
 */

// MODULES

/**
 * @module savedgames
 * @title Saved Games
 * @section_func
 * @desc The following functions are provided for working with saved games:
 * @ref gamecenter_saved_games_callback_subscribe
 * @ref gamecenter_saved_games_fetch
 * @ref gamecenter_saved_games_save
 * @ref gamecenter_saved_games_delete
 * @ref gamecenter_saved_games_get_data
 * @ref gamecenter_saved_games_resolve_conflict
 * @section_end
 *
 * @section_struct
 * @desc The following structs are used by the saved games functions:
 * @ref GameCenterSavedGame
 * @ref GameCenterSavedGamesFetchResult
 * @ref GameCenterSavedGamesSaveResult
 * @ref GameCenterSavedGamesDeleteResult
 * @ref GameCenterSavedGamesDataResult
 * @ref GameCenterSavedGamesResolveResult
 * @ref GameCenterSavedGamesEvent
 * @section_end
 *
 * @module_end
 */

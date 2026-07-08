
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
 * [[Note: `data` is a ${type.buffer}, so any binary payload is supported (not just UTF-8 text).]]
 *
 * @param {String} name The name of the saved game to write
 * @param {Buffer} data The ${type.buffer} holding the bytes to store in the saved game
 * @param {Function} callback The function to call with the result of the operation
 *
 * @event callback
 * @desc This callback is triggered when the save operation completes.
 * @member {Struct.GameCenterSavedGamesSaveResult} result A ${struct.GameCenterSavedGamesSaveResult} struct describing the saved slot
 * @event_end
 *
 * @example
 * ```gml
 * var _dataJSON = json_stringify(["level=5", "gold=100"]);
 * var _buff = buffer_create(string_byte_length(_dataJSON) + 1, buffer_fixed, 1);
 * buffer_write(_buff, buffer_string, _dataJSON);
 *
 * gamecenter_saved_games_save("slot1", _buff, function(_result) {
 *     if (_result.success) {
 *         show_debug_message($"Saved: {_result.name}");
 *     }
 * });
 *
 * buffer_delete(_buff);
 * ```
 * This code writes a JSON string into a buffer and saves it to a saved game named "slot1".
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
 * @function gamecenter_saved_games_data_request
 * @desc This function starts retrieving the data stored in the saved game with the given name. The result delivered to the callback carries **metadata only** (`handle_id` and `required_size`) — the native side holds the fetched bytes until you call ${function.gamecenter_saved_games_data_fetch} with a correctly-sized buffer to copy them out.
 *
 * When several saves share the same name (an unresolved conflict), the most-recently-modified one is returned.
 *
 * [[Important: A successful result holds the data on the native side until you call ${function.gamecenter_saved_games_data_fetch}. If you decide not to fetch it (e.g. you no longer need the slot), call ${function.gamecenter_saved_games_data_release} with the same `handle_id` to free it — otherwise it is held for the rest of the process lifetime.]]
 *
 * @param {String} name The name of the saved game to read
 * @param {Function} callback The function to call with the result of the operation
 *
 * @event callback
 * @desc This callback is triggered once the saved game's metadata is available.
 * @member {Struct.GameCenterSavedGamesDataResult} result A ${struct.GameCenterSavedGamesDataResult} struct containing the `handle_id`/`required_size` needed to fetch the data
 * @event_end
 *
 * @example
 * ```gml
 * gamecenter_saved_games_data_request("slot1", function(_result) {
 *     if (!_result.success) return;
 *
 *     var _buff = buffer_create(_result.required_size, buffer_fixed, 1);
 *     if (!gamecenter_saved_games_data_fetch(_result.handle_id, _buff)) {
 *         gamecenter_saved_games_data_release(_result.handle_id);
 *         buffer_delete(_buff);
 *         return;
 *     }
 *
 *     buffer_seek(_buff, buffer_seek_start, 0);
 *     var _dataJSON = buffer_read(_buff, buffer_string);
 *     buffer_delete(_buff);
 *
 *     show_debug_message($"Data: {_dataJSON}");
 * });
 * ```
 * This code requests the data for "slot1", then fetches it into a correctly-sized buffer once the metadata arrives.
 * @function_end
 */

/**
 * @function gamecenter_saved_games_data_fetch
 * @desc This function copies the data held by a prior ${function.gamecenter_saved_games_data_request} call into `data`, a caller-provided ${type.buffer}. This is a synchronous call — no callback is involved.
 *
 * [[Note: Size `data` to at least the `required_size` reported by ${function.gamecenter_saved_games_data_request}'s result. If `data` is too small the function returns `false` and the native-side hold is kept, so you can retry with a bigger buffer using the same `handle_id`. A successful fetch consumes the handle — it becomes invalid afterwards.]]
 *
 * @param {Real} handle_id The handle id from a ${struct.GameCenterSavedGamesDataResult}
 * @param {Buffer} data A ${type.buffer} sized to at least `required_size`, to receive the saved game's bytes
 *
 * @returns {Bool} Whether the data was copied into `data` successfully
 *
 * @example
 * ```gml
 * var _buff = buffer_create(_result.required_size, buffer_fixed, 1);
 * if (gamecenter_saved_games_data_fetch(_result.handle_id, _buff)) {
 *     // Use the data in _buff
 * }
 * buffer_delete(_buff);
 * ```
 * This code fetches a saved game's data into a buffer sized from a previous ${function.gamecenter_saved_games_data_request} result.
 * @function_end
 */

/**
 * @function gamecenter_saved_games_data_release
 * @desc This function releases the native-side hold on a saved game's data started by ${function.gamecenter_saved_games_data_request}, without fetching it. Call this if a `handle_id` from a successful result is never going to be passed to ${function.gamecenter_saved_games_data_fetch} (for example, you decided you no longer need that slot's data), so the extension does not keep the bytes in memory indefinitely.
 *
 * [[Note: This is a no-op error, not a crash, if `handle_id` is invalid or was already consumed (by a successful fetch, or a previous release) — it simply returns `false`.]]
 *
 * @param {Real} handle_id The handle id from a ${struct.GameCenterSavedGamesDataResult}
 *
 * @returns {Bool} Whether a held data entry for `handle_id` was found and released
 *
 * @example
 * ```gml
 * gamecenter_saved_games_data_request("slot1", function(_result) {
 *     if (!_result.success) return;
 *
 *     if (!shouldLoadThisSlot(_result)) {
 *         gamecenter_saved_games_data_release(_result.handle_id);
 *         return;
 *     }
 *
 *     // ... fetch and use the data
 * });
 * ```
 * This code releases the held data for a saved game without fetching it, based on some condition.
 * @function_end
 */

/**
 * @function gamecenter_saved_games_resolve_conflict
 * @desc This function resolves a saved game conflict. Pass the `conflict_id` from a "conflict" ${struct.GameCenterSavedGamesEvent} and the `data` you want to keep for that save name. The result is delivered to the callback.
 *
 * [[Note: `data` is a ${type.buffer}, so any binary payload is supported (not just UTF-8 text).]]
 *
 * @param {Real} conflict_id The conflict id taken from a "conflict" saved-games event
 * @param {Buffer} data The ${type.buffer} holding the bytes to keep as the resolved saved game
 * @param {Function} callback The function to call with the result of the operation
 *
 * @event callback
 * @desc This callback is triggered when the conflict has been resolved.
 * @member {Struct.GameCenterSavedGamesResolveResult} result A ${struct.GameCenterSavedGamesResolveResult} struct describing the resolved saved games
 * @event_end
 *
 * @example
 * ```gml
 * var _dataJSON = "level=5,gold=100";
 * var _buff = buffer_create(string_byte_length(_dataJSON) + 1, buffer_fixed, 1);
 * buffer_write(_buff, buffer_string, _dataJSON);
 *
 * gamecenter_saved_games_resolve_conflict(_conflict_id, _buff, function(_result) {
 *     if (_result.success) {
 *         show_debug_message($"Resolved conflict: {_result.conflict_id}");
 *     }
 * });
 *
 * buffer_delete(_buff);
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
 * @desc This struct is passed to the callback of ${function.gamecenter_saved_games_data_request}. It carries metadata only — pass `handle_id` to ${function.gamecenter_saved_games_data_fetch} (or ${function.gamecenter_saved_games_data_release}) to obtain (or discard) the actual bytes.
 * @member {Bool} success Whether the operation succeeded
 * @member {Real} error_code The error code (only meaningful when `success` is `false`)
 * @member {String} error_message A human-readable error description (only meaningful when `success` is `false`)
 * @member {String} name The name of the saved game that was read
 * @member {Real} handle_id The handle id identifying the held data, to pass to ${function.gamecenter_saved_games_data_fetch} or ${function.gamecenter_saved_games_data_release} (only meaningful when `success` is `true`)
 * @member {Real} required_size The size, in bytes, the buffer passed to ${function.gamecenter_saved_games_data_fetch} must be at least (only meaningful when `success` is `true`)
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
 * @ref gamecenter_saved_games_data_request
 * @ref gamecenter_saved_games_data_fetch
 * @ref gamecenter_saved_games_data_release
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

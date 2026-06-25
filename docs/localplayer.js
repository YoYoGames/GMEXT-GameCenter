
// FUNCTIONS

/**
 * @function gamecenter_local_player_authenticate
 * @desc This function authenticates the local player with Game Center. You must authenticate the local player before using any other Game Center feature.
 *
 * The result of the authentication is delivered to the given `callback`, which receives a single ${struct.GameCenterAuthResult} struct argument.
 *
 * [[Note: GameKit re-invokes the authentication handler whenever the authentication state changes (for example when the app returns to the foreground, or the player signs out and back in). This means the `callback` is **recurring**: it can fire multiple times across the lifetime of the app, not just once. Do not free any state the callback depends on after its first invocation.]]
 *
 * @param {Function} callback The function to call with the authentication result
 *
 * @event callback
 * @desc This callback is triggered whenever the local player's authentication state changes.
 * @member {Struct.GameCenterAuthResult} result A ${struct.GameCenterAuthResult} struct describing the result of the authentication
 * @event_end
 *
 * @example
 * ```gml
 * gamecenter_local_player_authenticate(function(_result) {
 *     if (_result.success) {
 *         show_debug_message($"Authenticated as {_result.player.display_name}");
 *     } else {
 *         show_debug_message($"Authentication failed ({_result.error_code}): {_result.error_message}");
 *     }
 * });
 * ```
 * This code authenticates the local player and outputs a debug message with the result.
 * @function_end
 */

/**
 * @function gamecenter_local_player_is_authenticated
 * @desc This function returns whether the local player is currently authenticated with Game Center.
 * @returns {Bool}
 *
 * @example
 * ```gml
 * if (gamecenter_local_player_is_authenticated()) {
 *     show_debug_message("Player is authenticated.");
 * }
 * ```
 * This code checks whether the local player is authenticated.
 * @function_end
 */

/**
 * @function gamecenter_local_player_is_underage
 * @desc This function returns whether the local player is underage.
 * @returns {Bool}
 *
 * @example
 * ```gml
 * var _underage = gamecenter_local_player_is_underage();
 * ```
 * This code gets whether the local player is underage.
 * @function_end
 */

/**
 * @function gamecenter_local_player_is_multiplayer_gaming_restricted
 * @desc This function returns whether multiplayer gaming is restricted for the local player.
 * @returns {Bool}
 *
 * @example
 * ```gml
 * var _restricted = gamecenter_local_player_is_multiplayer_gaming_restricted();
 * ```
 * This code gets whether multiplayer gaming is restricted for the local player.
 * @function_end
 */

/**
 * @function gamecenter_local_player_is_personalized_communication_restricted
 * @desc This function returns whether personalized communication is restricted for the local player, i.e. whether the player can use personalized communication on the device.
 * @returns {Bool}
 *
 * @example
 * ```gml
 * var _restricted = gamecenter_local_player_is_personalized_communication_restricted();
 * ```
 * This code gets whether personalized communication is restricted for the local player.
 * @function_end
 */

/**
 * @function gamecenter_local_player_get_info
 * @desc This function synchronously returns the local player's information as a ${struct.GameCenterPlayer} struct.
 *
 * [[Note: The local player must be authenticated (see ${function.gamecenter_local_player_authenticate}) before the returned information is valid.]]
 *
 * @returns {Struct.GameCenterPlayer}
 *
 * @example
 * ```gml
 * var _player = gamecenter_local_player_get_info();
 * show_debug_message(_player.display_name);
 * ```
 * This code gets the local player's information and outputs the display name in a debug message.
 * @function_end
 */

// STRUCTS

/**
 * @struct GameCenterPlayer
 * @desc This struct contains the information of a Game Center player.
 * @member {String} alias The player's alias (nickname)
 * @member {String} display_name The player's display name
 * @member {String} player_id The player's Game Center identifier (legacy)
 * @member {String} game_player_id The player's game-scoped Game Center identifier
 * @member {String} team_player_id The player's team-scoped Game Center identifier (may be empty on older OS versions)
 * @struct_end
 */

/**
 * @struct GameCenterAuthResult
 * @desc This struct contains the result of a local player authentication attempt (see ${function.gamecenter_local_player_authenticate}).
 *
 * [[Note: When `success` is `false`, `error_code` and `error_message` describe the failure and the other fields may be empty.]]
 *
 * @member {Bool} success Whether the authentication succeeded
 * @member {Real} error_code The error code (valid when `success` is `false`)
 * @member {String} error_message A description of the error (valid when `success` is `false`)
 * @member {String} authentication_state A short string describing the authentication state (e.g. `"authenticated"`, `"presenting_view"`, `"unknown"`)
 * @member {Bool} authenticated Whether the local player is authenticated
 * @member {Struct.GameCenterPlayer} player A ${struct.GameCenterPlayer} struct with the local player's information
 * @struct_end
 */

// MODULES

/**
 * @module localplayer
 * @title Local Player
 * @desc This module provides functions to authenticate and query the local Game Center player.
 *
 * [[Note: Game Center is an **Apple-only** feature, available on **iOS** and **macOS**. You must authenticate the local player using ${function.gamecenter_local_player_authenticate} before using any other Game Center feature.]]
 *
 * @section_func
 * @desc The following functions are provided to work with the local player:
 * @ref gamecenter_local_player_authenticate
 * @ref gamecenter_local_player_is_authenticated
 * @ref gamecenter_local_player_is_underage
 * @ref gamecenter_local_player_is_multiplayer_gaming_restricted
 * @ref gamecenter_local_player_is_personalized_communication_restricted
 * @ref gamecenter_local_player_get_info
 * @section_end
 *
 * @section_struct
 * @desc The following structs are used by the local player functions:
 * @ref GameCenterPlayer
 * @ref GameCenterAuthResult
 * @section_end
 *
 * @module_end
 */

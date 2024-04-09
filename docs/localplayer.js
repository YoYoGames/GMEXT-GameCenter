// Functions

/**
 * @func GameCenter_LocalPlayer_Authenticate
 * @desc This function requests the API for user authentication with GameCenter credentials. When using the Apple GameCenter extension you need to call this function before using any other functions. The function will not return any value but it will create a request that will trigger a ${event.social} callback upon completion.
 * @event social
 * @member {string} type "GameCenter_Authenticate"
 * @member {boolean} success Whether or not the task succeeded.
 * @event_end
 * 
 * @example
 * 
 * ```gml
 * GameCenter_LocalPlayer_Authenticate();
 * ```
 * 
 * @func_end
 */

/**
 * @func GameCenter_LocalPlayer_IsAuthenticated
 * @desc This function checks if the currently logged in user is authenticated or not.
 * @returns {boolean} Whether or not authentication succeeded.
 * @example
 * 
 * ```gml
 * var _auth = GameCenter_LocalPlayer_IsAuthenticated();
 * ```
 * 
 * @func_end
 */

/**
 * @func GameCenter_LocalPlayer_IsUnderage
 * @desc This function checks if the currently logged in user is underage or not.
 * @returns {boolean} Whether or not the current player is underaged.
 * @example
 * 
 * ```gml
 * var _underage = GameCenter_LocalPlayer_IsUnderage();
 * ```
 * 
 * @func_end
 */

/**
 * @func GameCenter_LocalPlayer_GetInfo
 * @desc This function queries the Apple GameCenter server for information on the current player. The function will return a JSON formatted string that can be parsed into a struct using ${function.json_parse}.
 * @returns {string} A **JSON formatted string** containing player information.
 * @example
 * 
 * ```gml
 * var _json = GameCenter_LocalPlayer_GetInfo();
 * var _player_info = json_parse(_json);
 * ```
 * 
 * @func_end
 */

/**
 * @func GameCenter_LocalPlayer_IsMultiplayerGamingRestricted

 * @desc This function returns whether multiplayer gaming is restricted or not.
 * @returns {boolean} Whether multiplayer gaming is restricted or not.
 * @example
 * 
 * ```gml
 * var _multiplayer_restricted = GameCenter_LocalPlayer_IsMultiplayerGamingRestricted();
 * ```
 * 
 * @func_end
 */

/**
 * @func GameCenter_LocalPlayer_IsPersonalizedCommunicationRestricted

 * @desc A value that indicates whether the player can use personalized communication on the device.
 *
 * See: [personalizedCommunicationRestricted](https://developer.apple.com/documentation/gamekit/gklocalplayer/3547278-personalizedcommunicationrestric)
 * 
 * @returns {boolean} Whether personalized communication is restricted or not.
 * @example
 * 
 * ```gml
 * GameCenter_LocalPlayer_IsPersonalizedCommunicationRestricted();
 * ```
 * 
 * @func_end
 */


// Modules

/**
 * @module localplayer
 * @title LocalPlayer
 * @section_func
 * @ref GameCenter_LocalPlayer_Authenticate
 * @ref GameCenter_LocalPlayer_IsAuthenticated
 * @ref GameCenter_LocalPlayer_IsUnderage
 * @ref GameCenter_LocalPlayer_GetInfo
 * @ref GameCenter_LocalPlayer_IsMultiplayerGamingRestricted
 * @ref GameCenter_LocalPlayer_IsPersonalizedCommunicationRestricted
 * @section_end
 * 
 * @module_end
 */
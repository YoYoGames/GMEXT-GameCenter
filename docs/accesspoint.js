
// FUNCTIONS

/**
 * @function gamecenter_access_point_set_active
 * @desc This function shows or hides the Game Center access point, the floating Game Center badge (`GKAccessPoint`).
 *
 * [[Note: The access point requires iOS 14 / macOS 11. On older OS versions this function returns `false` and does nothing.]]
 *
 * @param {Bool} active Whether the access point should be active (shown) or not
 * @returns {Bool} Whether the access point's active state was successfully set
 *
 * @example
 * ```gml
 * gamecenter_access_point_set_active(true);
 * ```
 * This code shows the Game Center access point.
 * @function_end
 */

/**
 * @function gamecenter_access_point_get_active
 * @desc This function returns whether the Game Center access point is currently active.
 *
 * [[Note: The access point requires iOS 14 / macOS 11. On older OS versions this function returns `false`.]]
 *
 * @returns {Bool} Whether the access point is active
 *
 * @example
 * ```gml
 * var _active = gamecenter_access_point_get_active();
 * show_debug_message($"Access point active: {_active}");
 * ```
 * This code gets whether the access point is active and outputs it in a debug message.
 * @function_end
 */

/**
 * @function gamecenter_access_point_set_location
 * @desc This function sets the screen corner in which the Game Center access point is displayed, using a ${constant.GameCenterAccessPointLocation} value.
 *
 * [[Note: The access point requires iOS 14 / macOS 11. On older OS versions this function returns `false` and does nothing.]]
 *
 * @param {Constant.GameCenterAccessPointLocation} location The screen corner in which to display the access point
 * @returns {Bool} Whether the location was successfully set
 *
 * @example
 * ```gml
 * gamecenter_access_point_set_location(GameCenterAccessPointLocation.TopTrailing);
 * ```
 * This code positions the access point in the top trailing corner of the screen.
 * @function_end
 */

/**
 * @function gamecenter_access_point_get_location
 * @desc This function returns the screen corner in which the Game Center access point is displayed, as the ${constant.GameCenterAccessPointLocation} value cast to a {Real}.
 *
 * [[Note: The access point requires iOS 14 / macOS 11. On older OS versions this function returns `-1`.]]
 *
 * @returns {Real} The location as the enum value, or `-1` if unavailable
 *
 * @example
 * ```gml
 * var _location = gamecenter_access_point_get_location();
 * if (_location == GameCenterAccessPointLocation.TopLeading)
 * {
 *     show_debug_message("Access point is in the top leading corner.");
 * }
 * ```
 * This code gets the access point's location and checks whether it is in the top leading corner.
 * @function_end
 */

/**
 * @function gamecenter_access_point_is_presenting_game_center
 * @desc This function returns whether the access point is currently presenting the Game Center UI.
 *
 * [[Note: The access point requires iOS 14 / macOS 11. On older OS versions this function returns `false`.]]
 *
 * @returns {Bool} Whether the access point is currently showing the Game Center UI
 *
 * @example
 * ```gml
 * if (gamecenter_access_point_is_presenting_game_center())
 * {
 *     show_debug_message("The Game Center UI is open.");
 * }
 * ```
 * This code checks whether the Game Center UI is currently being presented.
 * @function_end
 */

/**
 * @function gamecenter_access_point_is_visible
 * @desc This function returns whether the access point is currently visible on screen.
 *
 * [[Note: The access point requires iOS 14 / macOS 11. On older OS versions this function returns `false`.]]
 *
 * @returns {Bool} Whether the access point is currently on screen
 *
 * @example
 * ```gml
 * var _visible = gamecenter_access_point_is_visible();
 * ```
 * This code gets whether the access point is currently visible on screen.
 * @function_end
 */

/**
 * @function gamecenter_access_point_set_show_highlights
 * @desc This function sets whether the access point shows achievement and rank highlights.
 *
 * [[Note: The access point requires iOS 14 / macOS 11. On older OS versions this function returns `false` and does nothing.]]
 *
 * @param {Bool} show Whether the access point should show highlights or not
 * @returns {Bool} Whether the setting was successfully applied
 *
 * @example
 * ```gml
 * gamecenter_access_point_set_show_highlights(true);
 * ```
 * This code enables achievement and rank highlights on the access point.
 * @function_end
 */

/**
 * @function gamecenter_access_point_get_show_highlights
 * @desc This function returns whether the access point shows achievement and rank highlights.
 *
 * [[Note: The access point requires iOS 14 / macOS 11. On older OS versions this function returns `false`.]]
 *
 * @returns {Bool} Whether the access point shows highlights
 *
 * @example
 * ```gml
 * var _highlights = gamecenter_access_point_get_show_highlights();
 * ```
 * This code gets whether the access point shows highlights.
 * @function_end
 */

/**
 * @function gamecenter_access_point_get_coordinate
 * @desc This function returns a single component (X, Y, Width or Height, per ${constant.GameCenterAccessPointCoordinate}) of the access point's on-screen frame, in screen coordinates.
 *
 * [[Note: The access point requires iOS 14 / macOS 11. On older OS versions this function returns `-1`.]]
 *
 * @param {Constant.GameCenterAccessPointCoordinate} coordinate The frame component to retrieve
 * @returns {Real} The requested frame component in screen coordinates, or `-1` if unavailable
 *
 * @example
 * ```gml
 * var _x = gamecenter_access_point_get_coordinate(GameCenterAccessPointCoordinate.X);
 * var _y = gamecenter_access_point_get_coordinate(GameCenterAccessPointCoordinate.Y);
 * show_debug_message($"Access point at: {_x}, {_y}");
 * ```
 * This code gets the X and Y coordinates of the access point's on-screen frame.
 * @function_end
 */

/**
 * @function gamecenter_access_point_present_with_state
 * @desc This function triggers the access point to open a specific Game Center view, given by a ${constant.GameCenterViewState} value. The `callback` is fired with a ${struct.GameCenterViewResult} when the view is dismissed.
 *
 * [[Note: The access point requires iOS 14 / macOS 11. On an unsupported OS this function returns `false` and invokes the callback once with `success` set to `false`, so a caller awaiting the callback does not hang.]]
 * [[Note: The ${constant.GameCenterViewState} values `Challenges` and `LocalPlayerFriendsList` require newer OS versions (iOS 17.2 / macOS 14.2); selecting them on an older OS may show an empty or unexpected screen.]]
 *
 * @param {Constant.GameCenterViewState} state The Game Center view to open
 * @param {Function} callback The function to call when the presented view is dismissed
 *
 * @event callback
 * @desc This callback is triggered when the presented Game Center view is dismissed.
 * @member {Struct.GameCenterViewResult} result The result struct describing the dismissed view
 * @event_end
 *
 * @returns {Bool} Whether the view was successfully triggered
 *
 * @example
 * ```gml
 * gamecenter_access_point_present_with_state(GameCenterViewState.Leaderboards, function(_result)
 * {
 *     show_debug_message("Game Center view dismissed.");
 * });
 * ```
 * This code opens the Game Center leaderboards view from the access point and outputs a debug message when it is dismissed.
 * @function_end
 */

/**
 * @function gamecenter_access_point_present
 * @desc This function triggers the access point to open the default Game Center dashboard. The `callback` is fired with a ${struct.GameCenterViewResult} when the dashboard is dismissed.
 *
 * [[Note: The access point requires iOS 14 / macOS 11. On an unsupported OS this function returns `false` and invokes the callback once with `success` set to `false`, so a caller awaiting the callback does not hang.]]
 *
 * @param {Function} callback The function to call when the presented view is dismissed
 *
 * @event callback
 * @desc This callback is triggered when the presented Game Center dashboard is dismissed.
 * @member {Struct.GameCenterViewResult} result The result struct describing the dismissed view
 * @event_end
 *
 * @returns {Bool} Whether the dashboard was successfully triggered
 *
 * @example
 * ```gml
 * gamecenter_access_point_present(function(_result)
 * {
 *     show_debug_message("Game Center dashboard dismissed.");
 * });
 * ```
 * This code opens the default Game Center dashboard from the access point and outputs a debug message when it is dismissed.
 * @function_end
 */

// CONSTANTS

/**
 * @const GameCenterAccessPointLocation
 * @desc This enumeration contains the screen corners in which the Game Center access point can be displayed.
 * @member TopLeading The access point is displayed in the top leading corner of the screen.
 * @member TopTrailing The access point is displayed in the top trailing corner of the screen.
 * @member BottomLeading The access point is displayed in the bottom leading corner of the screen.
 * @member BottomTrailing The access point is displayed in the bottom trailing corner of the screen.
 * @const_end
 */

/**
 * @const GameCenterAccessPointCoordinate
 * @desc This enumeration contains the components of the access point's on-screen frame.
 * @member X The x coordinate of the frame.
 * @member Y The y coordinate of the frame.
 * @member Width The width of the frame.
 * @member Height The height of the frame.
 * @const_end
 */

/**
 * @const GameCenterViewState
 * @desc This enumeration contains the Game Center views that can be presented from the access point.
 * @member Default The default Game Center view.
 * @member Leaderboards The leaderboards view.
 * @member Achievements The achievements view.
 * @member Challenges The challenges view.
 * @member LocalPlayerProfile The local player's profile view.
 * @member Dashboard The Game Center dashboard.
 * @member LocalPlayerFriendsList The local player's friends list view.
 * @const_end
 */

// MODULES

/**
 * @module accesspoint
 * @title Access Point
 * @section_func
 * @desc The following functions are provided to control the Game Center access point:
 * @ref gamecenter_access_point_set_active
 * @ref gamecenter_access_point_get_active
 * @ref gamecenter_access_point_set_location
 * @ref gamecenter_access_point_get_location
 * @ref gamecenter_access_point_is_presenting_game_center
 * @ref gamecenter_access_point_is_visible
 * @ref gamecenter_access_point_set_show_highlights
 * @ref gamecenter_access_point_get_show_highlights
 * @ref gamecenter_access_point_get_coordinate
 * @ref gamecenter_access_point_present_with_state
 * @ref gamecenter_access_point_present
 * @section_end
 *
 * @section_const
 * @desc The following enumerations are provided to configure the Game Center access point:
 * @ref GameCenterAccessPointLocation
 * @ref GameCenterAccessPointCoordinate
 * @ref GameCenterViewState
 * @section_end
 *
 * @module_end
 */

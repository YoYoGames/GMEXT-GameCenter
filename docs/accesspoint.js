// Functions

/**
 * @func GameCenter_AccessPoint_SetActive
 * @desc Set a boolean value that determines whether to display the access point.
 * @param {boolean} isActive Whether the access point should be active.
 * 
 * @example
 * 
 * ```gml
 * GameCenter_AccessPoint_SetActive(true);
 * ```
 * 
 * @func_end
 */

/**
 * @func GameCenter_AccessPoint_GetActive
 * @desc Get a boolean value that determines whether to display the access point.
 * @returns {boolean} Whether the access point is active.
 * 
 * @example
 * 
 * ```gml
 * var _active = GameCenter_AccessPoint_GetActive();
 * ```
 * 
 * @func_end
 */

/**
 * @func GameCenter_AccessPoint_SetLocation
 * @desc Set the corner of the screen to display the access point.
 * @param {const.GameCenter_AccessPoint_Location} pointlocation The corner of the screen to display the access point.
 * 
 * @example
 * 
 * ```gml
 * GameCenter_AccessPoint_SetLocation(GameCenter_AccessPoint_Location_BottomLeading);
 * ```
 * 
 * @func_end
 */

/**
 * @func GameCenter_AccessPoint_GetLocation
 * @desc Get the corner of the screen to display the access point.
 * @returns {const.GameCenter_AccessPoint_Location}
 * 
 * @example
 * 
 * ```gml
 * var _location = GameCenter_AccessPoint_GetLocation();
 * switch(_location) {
 *     case GameCenter_AccessPoint_Location_TopLeading:
 *         break;
 *     case GameCenter_AccessPoint_Location_TopTrailing:
 *         break;
 *     case GameCenter_AccessPoint_Location_BottomLeading:
 *         break;
 *     case GameCenter_AccessPoint_Location_BottomTrailing:
 *         break;
 *  }
 * ```
 * 
 * @func_end
 */

/**
 * @func GameCenter_AccessPoint_IsPresentingGameCenter
 * @desc A boolean value that indicates whether the game is presenting the Game Center dashboard.
 * @returns {boolean}
 * 
 * @example
 * 
 * ```gml
 * var _presenting = GameCenter_AccessPoint_IsPresentingGameCenter();
 * ```
 * 
 * @func_end
 */

/**
 * @func GameCenter_AccessPoint_IsVisible
 * @desc A boolean value that indicates whether the access point is visible.
 * @returns {boolean}
 * 
 * @example
 * 
 * ```gml
 * var _visible = GameCenter_AccessPoint_IsVisible();
 * ```
 * 
 * @func_end
 */

/**
 * @func GameCenter_AccessPoint_SetShowHighlights
 * @desc Set a boolean value that indicates whether to display highlights for achievements and current ranks for leaderboards.
 * @param {boolean} show Whether to display highlights for achievements and current ranks for leaderboards.
 * 
 * @example
 * 
 * ```gml
 * GameCenter_AccessPoint_SetShowHighlights(true);
 * ```
 * 
 * @func_end
 */

/**
 * @func GameCenter_AccessPoint_GetShowHighlights
 * @desc Get a boolean value that indicates whether to display highlights for achievements and current ranks for leaderboards.
 * @returns {boolean}
 * 
 * @example
 * 
 * ```gml
 * var _highlights = GameCenter_AccessPoint_GetShowHighlights();
 * ```
 * 
 * @func_end
 */

/**
 * @func GameCenter_AccessPoint_GetCoordinate
 * @desc Get information on the frame of the access point in screen coordinates.
 * @param {const.GameCenter_AccessPoint_Coordinate} coordinate The type of coordinate to get.
 * @returns {real} The value of the requested coordinate.
 * 
 * @example
 * 
 * ```gml
 * var _origin = [
 *     GameCenter_AccessPoint_GetCoordinate(GameCenter_AccessPoint_Coordinate_OriginX),
*      GameCenter_AccessPoint_GetCoordinate(GameCenter_AccessPoint_Coordinate_OriginY)
 * ];
 * ```
 * 
 * @func_end
 */

/**
 * @func GameCenter_AccessPoint_PresentWithState
 * @desc This function displays the Game Center dashboard in the specified state.
 * @param {const.GameCenter_AccessPoint_State} state The state in which to display the dashboard.
 * 
 * @example
 * 
 * ```gml
 * GameCenter_AccessPoint_PresentWithState(GameCenter_AccessPoint_State_Achievements);
 * ```
 * 
 * @func_end
 */

/**
 * @func GameCenter_AccessPoint_Present
 * @desc This function displays the Game Center dashboard.
 * 
 * @example
 * 
 * ```gml
 * GameCenter_AccessPoint_Present();
 * ```
 * 
 * @func_end
 */

/**
 * @module AccessPoint
 * 
 * @section_func
 * @ref GameCenter_AccessPoint_SetActive
 * @ref GameCenter_AccessPoint_GetActive
 * @ref GameCenter_AccessPoint_SetLocation
 * @ref GameCenter_AccessPoint_GetLocation
 * @ref GameCenter_AccessPoint_IsPresentingGameCenter
 * @ref GameCenter_AccessPoint_IsVisible
 * @ref GameCenter_AccessPoint_SetShowHighlights
 * @ref GameCenter_AccessPoint_GetShowHighlights
 * @ref GameCenter_AccessPoint_GetCoordinate
 * @ref GameCenter_AccessPoint_PresentWithState
 * @ref GameCenter_AccessPoint_Present
 * @section_end
 * 
 * @module_end
 */
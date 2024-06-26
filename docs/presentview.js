// Functions

/**
 * @func GameCenter_PresentView_Default
 * @desc This function displays the general Apple GameCenter overlay screen with information on achievements and leaderboards. This overlay will trigger a ${event.social} when closed.
 * @event social
 * @member {string} type The string `"GameCenter_PresentView_DidFinish"`
 * @member {boolean} success Whether or not the task succeeded.
 * @event_end
 * 
 * @example
 * 
 * ```gml
 * GameCenter_PresentView_Default();
 * ```
 * 
 * @func_end
 */

/**
 * @func GameCenter_PresentView_Achievements
 * @desc This function displays the Apple GameCenter achievement overlay screen with all your achievement information. This overlay will trigger a ${event.social} when closed.
 * @event social
 * @member {string} type The string `"GameCenter_PresentView_DidFinish"`
 * @member {boolean} success Whether or not the task succeeded.
 * @event_end
 * 
 * @example
 * 
 * ```gml
 * GameCenter_PresentView_Achievements();
 * ```
 * 
 * @func_end
 */

/**
 * @func GameCenter_PresentView_Achievement
 * @desc This function displays the Apple GameCenter achievement overlay screen with the information of the specified achievement. This overlay will trigger a ${event.social} when closed.
 * @param {string} achievement_id The unique achievement identification string.
 * @event social
 * @member {string} type "GameCenter_PresentView_DidFinish"
 * @member {boolean} success Whether or not the task succeeded.
 * @event_end
 * 
 * @example
 * 
 * ```gml
 * GameCenter_PresentView_Achievement(achievement_id);
 * ```
 * 
 * @func_end
 */

/**
 * @func GameCenter_PresentView_Leaderboards
 * @desc This function displays the Apple GameCenter achievement overlay screen with all your leaderboards information. This overlay will trigger a ${event.social} when closed.
 * @event social
 * @member {string} type "GameCenter_PresentView_DidFinish"
 * @member {boolean} success Whether or not the task succeeded.
 * @event_end
 * 
 * @example
 * 
 * ```gml
 * GameCenter_PresentView_Leaderboards();
 * ```
 * 
 * @func_end
 */

/**
 * @func GameCenter_PresentView_Leaderboard
 * @desc This function displays the Apple GameCenter leaderboard overlay screen with the information of a specific leaderboard. This overlay will trigger a ${event.social} when closed.
 * @param {string} id The unique leaderboard identification string.
 * @param {constant.GameCenter_Leaderboard_TimeScope} timescope The time scope to be displayed.
 * @param {constant.GameCenter_Leaderboard_PlayerScope} playerscope The player scope to be displayed.
 * @event social
 * @member {string} type "GameCenter_PresentView_DidFinish"
 * @member {boolean} success Whether or not the task succeeded.
 * @event_end
 * 
 * @example
 * 
 * ```gml
 * GameCenter_PresentView_Leaderboard("YYLeaderboard1", GameCenter_Leaderboard_TimeScope_AllTime, GameCenter_Leaderboard_PlayerScope_Global);
 * ```
 * 
 * @func_end
 */

// Constants


// Modules

/**
 * @module presentview
 * @title PresentView
 * @section_func
 * @ref GameCenter_PresentView_Default
 * @ref GameCenter_PresentView_Achievements
 * @ref GameCenter_PresentView_Achievement
 * @ref GameCenter_PresentView_Leaderboards
 * @ref GameCenter_PresentView_Leaderboard
 * @section_end
 * 
 * @module_end
 */
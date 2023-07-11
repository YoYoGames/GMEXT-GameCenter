// Functions

/**
 * @func GameCenter_Achievement_Report
 * @desc This function requests the Apple GameCenter API to update the completion percentage of the given achievement. The function will not return any value but it will create a request that will trigger an ${event.social} callback upon completion.
 * @param {string} identifier The identifier for the achievement.
 * @param {real} percent The new completion percentage.
 * @param {boolean} showcompletionbanner Whether to show the completion banner.
 * @event social
 * @member {string} type "GameCenter_Achievement_Report"
 * @member {boolean} success Whether or not the task succeeded.
 * @member {string} achievement_id The unique name of the achievement.
 * @event_end
 * 
 * @example
 * 
 * ```gml
 * GameCenter_Achievement_Report("YYAchievement2", 100, true);
 * ```
 * 
 * @func_end
 */

/**
 * @func GameCenter_Achievement_ResetAll
 * @desc This function resets all previously earned/reported achievements. This function is for debug purposes only and should not be used in production, unless specifically required.
 * @event social
 * @member {string} type "GameCenter_Achievement_ResetAll"
 * @member {boolean} success Whether or not the task succeeded.
 * @event_end
 * 
 * @example
 * 
 * ```gml
 * GameCenter_Achievement_ResetAll();
 * ```
 * 
 * @func_end
 */

/**
 * @func GameCenter_Achievement_Load
 * @desc This function will load data from all the achievements the player has progressed on.
 * @event social
 * @member {string} type "GameCenter_Achievement_Load"
 * @member {boolean} success Whether or not the task succeeded.
 * @member {string} A **JSON formatted string** containing an array of ${struct.AchievementJSON} information (can be parsed into a struct using ${function.json_parse})
 * @event_end
 * 
 * @example
 * 
 * ```gml
 * GameCenter_Achievement_Load();
 * ```
 * 
 * @func_end
 */

// Constants



// Modules

/**
 * @module Leaderboard
 * 
 * @section_func
 * @ref GameCenter_Achievement_Report
 * @ref GameCenter_Achievement_ResetAll
 * @ref GameCenter_Achievement_Load
 * @section_end
 * 
 * @module_end
 */
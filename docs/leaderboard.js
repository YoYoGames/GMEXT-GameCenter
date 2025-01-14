// Functions

/**
 * @func GameCenter_Leaderboard_Submit
 * @desc This function requests the Apple GameCenter API to submit a score to a given leaderboard. The function will not return any value but it will create a request that will trigger a ${event.social} callback when the task is resolved.
 * @param {string} id The unique identifier of the leaderboard.
 * @param {real} score The value to be submitted to the leaderboard (remember that only the highest score value is displayed in the leaderboard).
 * @param {real} [context] This is an integer value that your game uses. It corresponds to the [context](https://developer.apple.com/documentation/gamekit/gkscore/1399250-context?language=objc) parameter.
 * @event social
 * @member {string} type "GameCenter_Leaderboard_Submit"
 * @member {boolean} success Whether or not the task succeeded.
 * @event_end
 * 
 * @example
 * 
 * ```gml
 * var _score = irandom(999);
 * GameCenter_Leaderboard_Submit("YYLeaderboard2", _score);
 * ```
 * 
 * @func_end
 */

/**
 * @func GameCenter_Leaderboard_LoadGlobal
 * @desc This function loads the leaderboard's global data for the specified leaderboard IDs that Game Center uses.
 * @param {string} leaderboardID ID of the leaderboard
 * @param {constant.GameCenter_Leaderboard_TimeScope} timeScope The time scope to load (today, week or all time).
 * @param {real} rangeStart Specifies the range of ranks to use for getting the scores. The minimum rank is 1 and the maximum rank is 100.
 * @param {real} rangeEnd 	Specifies the range of ranks to use for getting the scores. The minimum rank is 1 and the maximum rank is 100.
 * @event social
 * @member {string} type "GameCenter_Leaderboard_Load"
 * @member {string} leaderboard_id Whether or not the task succeeded.
 * @member {real} id 
 * @member {constant.GameCenter_Leaderboard_TimeScope} time_scope The time scope that was loaded.
 * @member {real} range_start The range start of ranks to use for getting the scores (1-100).
 * @member {real} range_end The range end of ranks to use for getting the scores (1-100).
 * @member {constant.GameCenter_Leaderboard_PlayerScope} player_scope The player scope that was loaded.
 * @member {string} leaderboard_title The title of the leaderboard.
 * @member {string} leaderboard_group 
 * @member {constant.GameCenter_Leaderboard_Type} leaderboard_type The type of leaderboard.
 * @member {real} leaderboard_start_date The start date of the leaderboard.
 * @member {real} leaderboard_next_start_date The next start date of the leaderboard.
 * @member {real} leaderboard_duration The duration of the leaderboard.
 * @member {boolean} success the **error_*** are only present if **success** is `false` (async response will not have any other members in that case)
 * @member {real} error_code The error code returned, in case of an error.
 * @member {string} error_message The error message, in case of an error.
 * @member {real} total_players_count The total number of players in the leaderboard.
 * @member {real} local_context 
 * @member {real} local_date 
 * @member {real} local_rank 
 * @member {real} local_score 
 * @member {string} local_formatted_score 
 * @member {string} local_info 
 * @member {real} entries for the following **X** will take values from **0** to **entries-1**
 * @member {real} entry_context_X The context for the X'th entry.
 * @member {real} entry_date_X The date of the X'th entry.
 * @member {real} entry_rank_X The rank of the X'th entry.
 * @member {real} entry_score_X The score for the X'th entry.
 * @member {string} entry_formatted_score_X 
 * @member {string} entry_info_X entry_info_X
 * @event_end
 * 
 * @example
 * 
 * ```gml
 * GameCenter_Leaderboard_LoadGlobal("YYLeaderboard2", GameCenter_Leaderboard_TimeScope_AllTime, 1, 5);
 * ```
 * 
 * @func_end
 */

/**
 * @func GameCenter_Leaderboard_LoadFriendsOnly
 * @desc This function loads the Friends data for the specified leaderboard IDs that Game Center uses.
 * @param {string} leaderboardID The ID of the leaderboard to load.
 * @param {constant.GameCenter_Leaderboard_TimeScope} timeScope The time scope to load (today, week or all time).
 * @param {real} rangeStart Specifies the range of ranks to use for getting the scores. The minimum rank is 1 and the maximum rank is 100.
 * @param {real} rangeEnd 	Specifies the range of ranks to use for getting the scores. The minimum rank is 1 and the maximum rank is 100.
 * @event social
 * @member {string} type "GameCenter_Leaderboard_Load"
 * @member {string} leaderboard_id Whether or not the task succeeded.
 * @member {real} id 
 * @member {constant.GameCenter_Leaderboard_TimeScope} time_scope The time scope that was loaded.
 * @member {real} range_start The range start of ranks to use for getting the scores (1-100).
 * @member {real} range_end The range end of ranks to use for getting the scores (1-100).
 * @member {constant.GameCenter_Leaderboard_PlayerScope} player_scope The player scope that was loaded.
 * @member {string} leaderboard_title The title of the leaderboard.
 * @member {string} leaderboard_group 
 * @member {constant.GameCenter_Leaderboard_Type} leaderboard_type The type of leaderboard.
 * @member {real} leaderboard_start_date The start date of the leaderboard.
 * @member {real} leaderboard_next_start_date The next start date of the leaderboard.
 * @member {real} leaderboard_duration The duration of the leaderboard.
 * @member {boolean} success the **error_*** are only present if **success** is `false` (async response will not have any other members in that case)
 * @member {real} error_code The error code returned, in case of an error.
 * @member {string} error_message The error message, in case of an error.
 * @member {real} total_players_count The total number of players in the leaderboard.
 * @member {real} local_context 
 * @member {real} local_date 
 * @member {real} local_rank 
 * @member {real} local_score 
 * @member {string} local_formatted_score 
 * @member {string} local_info 
 * @member {real} entries for the following **X** will take values from **0** to **entries-1**
 * @member {real} entry_context_X The context for the X'th entry.
 * @member {real} entry_date_X The date of the X'th entry.
 * @member {real} entry_rank_X The rank of the X'th entry.
 * @member {real} entry_score_X The score for the X'th entry.
 * @member {string} entry_formatted_score_X 
 * @member {string} entry_info_X entry_info_X
 * @event_end
 * 
 * @example
 * 
 * ```gml
 * GameCenter_Leaderboard_LoadFriendsOnly("YYLeaderboard1", GameCenter_Leaderboard_TimeScope_AllTime, 1, 5);
 * ```
 * 
 * @func_end
 */

// Constants

/**
 * @constant GameCenter_Leaderboard_PlayerScope
 * @desc A constant that tells whose scores to show
 * @member GameCenter_Leaderboard_PlayerScope_Global This leaderboard shows all scores
 * @member GameCenter_Leaderboard_PlayerScope_FriendsOnly This leaderboard shows friends only
 * @const_end
 */

/**
 * @constant GameCenter_Leaderboard_TimeScope
 * @desc A constant that tells the time period to show scores from
 * @member GameCenter_Leaderboard_TimeScope_Today The leaderboard shows today's scores
 * @member GameCenter_Leaderboard_TimeScope_Week The leaderboard shows this week's scores
 * @member GameCenter_Leaderboard_TimeScope_AllTime The leaderboard shows all-time scores
 * @const_end
 */

/**
 * @constant GameCenter_Leaderboard_Type
 * @desc A constant describing the type of leaderboard: classic (all-time) or recurring (interval)
 * @member GameCenter_Leaderboard_Type_Classic This type of leaderboard tracks all-time scores
 * @member GameCenter_Leaderboard_Type_Recurring This type of leaderboard resets based on an interval that you define
 * @const_end
 */

// Modules

/**
 * @module leaderboard
 * @title Leaderboard
 * @section_func
 * @ref GameCenter_Leaderboard_Submit
 * @ref GameCenter_Leaderboard_LoadGlobal
 * @ref GameCenter_Leaderboard_LoadFriendsOnly
 * @section_end
 * 
 * @section_const
 * @ref GameCenter_Leaderboard_PlayerScope
 * @ref GameCenter_Leaderboard_TimeScope
 * @ref GameCenter_Leaderboard_Type
 * @section_end
 * 
 * @module_end
 */
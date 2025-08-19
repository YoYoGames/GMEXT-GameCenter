// Functions

/**
 * @func GameCenter_SavedGames_Fetch
 * @desc This function requests the Apple GameCenter API to fetch all the existing saved slots. The function will not return any value but it will create a request that will trigger a ${event.social} callback when the task is resolved.
 * @event social
 * @member {string} type The string `"GameCenter_SavedGames_Fetch"`
 * @member {boolean} success Whether or not the task succeeded.
 * @member {string} slots A **JSON formatted string** with an **array** of ${struct.SlotJSON} (can be parsed into a struct using ${function.json_parse})
 * @event_end
 * 
 * @example
 * 
 * ```gml
 * GameCenter_SavedGames_Fetch();
 * ```
 * 
 * @func_end
 */

/**
 * @func GameCenter_SavedGames_Save
 * @desc This function requests the Apple GameCenter API to save a data string to a save slot. If the slot doesn't exist it gets created, if it exists data is overwritten. The function will not return any value but it will create a request that will trigger a ${event.social} callback when the task is resolved.
 * 
 * @param {string} name The unique identifier of the save game slot.
 * @param {string} data The data string to be saved. Note that you can save complex data by using structs/arrays/maps/lists and converting them to strings.
 * 
 * @event social
 * @desc Triggered on save.
 * @member {string} type The string `"GameCenter_SavedGames_Save"`
 * @member {real} name The unique identifier of the save game slot.
 * @member {string} slot A **JSON formatted string** following the ${struct.SlotJSON} structure. (can be parsed into a struct using ${function.json_parse})
 * @member {boolean} success Whether or not the task succeeded.
 * @member {real} [error_code] The error code, in case of an error
 * @member {real} [error_message] The error message, in case of an error
 * @event_end
 * 
 * @event social
 * @desc Triggered when saved games contain conflicts.
 * @member {string} type The string `"GameCenter_SavedGames_HasConflict"`
 * @member {real} conflict_id The unique ID of the conflict
 * @member {string} slots A **JSON formatted string** containing an array of structs (can be parsed using ${function.json_parse})
 * @event_end
 * 
 * @event social
 * @desc Triggered when data changes in a saved game file.
 * @member {string} type The string `"GameCenter_SavedGames_DidModify"`
 * @member {string} player The unique identifier of the player
 * @member {string} slot The slot of the game save
 * @event_end
 * 
 * @example
 * 
 * ```gml
 * GameCenter_SavedGames_Save(name, data);
 * ```
 * 
 * @func_end
 */

/**
 * @func GameCenter_SavedGames_Delete
 * @desc This function requests the Apple GameCenter API to delete an existing save slot with the given name. The function will not return any value but it will create a request that will trigger a ${event.social} callback when the task is resolved.
 * @param {string} name The unique identifier of the save game slot.
 * @event social
 * @member {string} type The string `"GameCenter_SavedGames_Delete"`
 * @member {boolean} success Whether or not the task succeeded.
 * @event_end
 * 
 * @example
 * 
 * ```gml
 * GameCenter_SavedGames_Delete(name);
 * ```
 * 
 * @func_end
 */

/**
 * @func GameCenter_SavedGames_GetData
 * @desc This function requests the Apple GameCenter API to get the data string saved inside a given save slot. The function will not return any value but it will create a request that will trigger a ${event.social} callback when the task is resolved.
 * @param {string} name The unique identifier of the save game slot.
 * @event social
 * @member {string} type The string `"GameCenter_SavedGames_GetData"`
 * @member {boolean} success Whether or not the task succeeded.
 * @member {string} data The data stored inside the save slot.
 * @event_end
 * 
 * @example
 * 
 * ```gml
 * GameCenter_SavedGames_GetData(name);
 * ```
 * 
 * @func_end
 */

/**
 * @func GameCenter_SavedGames_ResolveConflict
 * @desc This function requests the Apple GameCenter API to perform a conflict resolution given a conflict ID. The function will not return any value but it will create a request that will trigger a ${event.social} callback when the task is resolved.
 * 
 * @param {real} conflict_id The unique identifier of the conflict
 * @param {string} data A string containing the data you want to save (note that you can use a JSON formatted string to store data)
 * 
 * @event social
 * @member {string} type The string `"GameCenter_SavedGames_ResolveConflict"`
 * @member {real} conflict_id The unique identification index of the resolved conflict
 * @member {boolean} success Whether or not the task succeeded
 * @member {real} [error_code] The error code, in case of an error
 * @member {real} [error_message] The error message, in case of an error
 * @event_end
 * 
 * @example
 * 
 * ```gml
 * GameCenter_SavedGames_ResolveConflict(conflict_id, data);
 * ```
 * 
 * @func_end
 */


// Constants

// Structs

/**
 * @struct SlotJSON
 * @member {string} playerID A unique identifier for a player of the game.
 * @member {string} deviceName The name of the device that the player used to save the game.
 * @member {date} modificationDate The date when you saved the game data or modified it.
 * @member {string} name The name of the saved game.
 * @struct_end
 */

// Modules

/**
 * @module savedgames
 * @title SavedGames
 * 
 * @section_func
 * @ref GameCenter_SavedGames_Fetch
 * @ref GameCenter_SavedGames_Save
 * @ref GameCenter_SavedGames_Delete
 * @ref GameCenter_SavedGames_GetData
 * @ref GameCenter_SavedGames_ResolveConflict
 * @section_end
 * 
 * @section_struct
 * @ref SlotJSON
 * @section_end
 * 
 * @module_end
 */
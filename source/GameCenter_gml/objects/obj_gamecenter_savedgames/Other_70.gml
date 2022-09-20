/// @description Handle callbacks

var count, conflictIndex, slotsArray, slotData;

switch(async_load[?"type"])
{
	// @triggered by GameCenter_SavedGames_Save()
	case "GameCenter_SavedGames_Save":
	// @triggered by GameCenter_SavedGames_Delete()
	case "GameCenter_SavedGames_Delete":
		
		// Early exit if not successful
		if (!async_load[?"success"]) break;
		
		// This function is responsible for fetching from the Apple GameCenter
		// servers all the save slots that were created.
		// The function triggers a Social Async callback.
		GameCenter_SavedGames_Fetch();
		break;

	
	// @triggered by GameCenter_SavedGames_Fetch()
	case "GameCenter_SavedGames_Fetch":
		
		// Early exit if not successful
		if (!async_load[?"success"]) break;
		
		// Exit edit mode
		selected = ""
		instance_destroy(Obj_GameCenter_SavedGames_Point);
		instance_destroy(Obj_GameCenter_SavedGames_Slot);
		setSlotEditMode(false);
		
		// Loop through all the slots
		slotsArray = json_parse(async_load[?"slots"]);	
		count = array_length(slotsArray)
		for(var i = 0 ; i < count ; i++)
		{
			slotData = slotsArray[i];
			// Create a new instance of slot for each slot there is.
			with (instance_create_depth(bbox_left, y + i*100, depth, Obj_GameCenter_SavedGames_Slot))
			{
				deviceName = slotData.deviceName;
				modificationDate = slotData.modificationDate;
				name = slotData.name;		
				text = name;
			}
		}
		
		break;

	// @triggered by GameCenter_SavedGames_GetData()
	case "GameCenter_SavedGames_GetData":
		
		// Early exit if not successful
		if (!async_load[?"success"]) break;
		
		// Go through all the saved data and unpack it (load it)
		var dataArray = json_parse(async_load[?"data"]);
		count = array_length(dataArray);
		for(var i = 0 ; i < count; i++)
		{
			var objData = dataArray[i];
			var ins = instance_create_depth(objData.x, objData.y, depth, Obj_GameCenter_SavedGames_Point);
			ins.image_index = objData.image_index;
		}
		// Enter the slot edit mode
		setSlotEditMode(true);
		
		break;

	// @triggered by GameCenter_SavedGames_ResolveConflict()
	case "GameCenter_SavedGames_ResolveConflict":
	
		conflictIndex = async_load[?"conflictIndex"]
		// Early exit if not successful
		if (!async_load[?"success"]) break;		
		break;

	
	// @triggered whenever there is a modification to a save slot
	case "GameCenter_SavedGames_DidModify":
	
		// you can check slot and player information
		var playerData = json_parse(async_load[?"player"]);
		slotData = json_parse(async_load[?"slot"]);
		break;
	
	// @triggered whenever there is saving conflict
	case "GameCenter_SavedGames_HasConflict":
	
		// The conflictIndex is an unique identification id of the conflict
		// and can be used to call 'GameCenter_SavedGames_ResolveConflict'
		// for solving the respective conflict.
		conflictIndex = async_load[?"conflictIndex"];
		slotsArray = json_decode(async_load[?"slots"]);
				
		// Loop through all the slots
		count = array_length(slotsArray)
		for(var i = 0 ; i < count ; i++)
		{
			slotData = slotsArray[i];
		
			// Handle the slotData accordingly
		}
		
		// This requires select which data you will approved
		// GameCenter_SavedGames_ResolveConflict(conflictIndex, "<the data that you choose>")
		
		break;
	
}


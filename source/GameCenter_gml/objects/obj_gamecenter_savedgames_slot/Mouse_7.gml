/// @description Get data

// Early exit if locked
if(locked) exit
	
Obj_GameCenter_SavedGames.selected = name

// This function gets data from the Apple GameCenter
// refering to the specific save slot.
// The function triggers a Social Async callback.
GameCenter_SavedGames_GetData(name);

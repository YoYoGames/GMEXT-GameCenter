/// @description Get data

// Early exit if locked
if(locked) exit
	
Obj_GameCenter_SavedGames.selected = name

// This function gets data from the Apple GameCenter
// refering to the specific save slot.
// The result is delivered to the callback handled by Obj_GameCenter_SavedGames.
gamecenter_saved_games_data_request(name, Obj_GameCenter_SavedGames.handleGetData);

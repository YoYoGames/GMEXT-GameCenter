/// @description Delete slot

// Early exit if locked
if(locked) exit;
	
// This function deletes a save slot with a given name from the Apple GameCenter servers.
// The result is delivered to the callback handled by Obj_GameCenter_SavedGames.
gamecenter_saved_games_delete(Obj_GameCenter_SavedGames.selected, Obj_GameCenter_SavedGames.handleSaveOrDelete)

Obj_GameCenter_SavedGames.selected = ""

instance_destroy(Obj_GameCenter_SavedGames_Point);
	
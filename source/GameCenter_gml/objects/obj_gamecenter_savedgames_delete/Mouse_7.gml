/// @description Delete slot

// Early exit if locked
if(locked) exit;
	
// This function deletes a save slot with a given name from the Apple GameCenter servers.
// The function triggers a Social Async callback.
GameCenter_SavedGames_Delete(Obj_GameCenter_SavedGames.selected)

Obj_GameCenter_SavedGames.selected = ""

instance_destroy(Obj_GameCenter_SavedGames_Point);
	
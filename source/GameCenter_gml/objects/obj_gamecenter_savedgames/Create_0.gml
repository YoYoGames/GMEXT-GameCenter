/// @description Initialize variables

selected = "";
msgId = noone;

// This function fetchs from the Apple GameCenter
// servers all the save slots that were created.
// The function triggers a Social Async callback.
GameCenter_SavedGames_Fetch();

// This is a helper function that is used to control button states
// when in slot edit mode some buttons need to be locked and anothers
// unlocked (this function handles that logic)
function setSlotEditMode(enable)
{
	Obj_GameCenter_SavedGames_New.locked = enable;
	with(Obj_GameCenter_SavedGames_Slot) locked = enable;
	
	Obj_GameCenter_SavedGames_Save.locked = !enable;
	Obj_GameCenter_SavedGames_Close.locked = !enable;
	Obj_GameCenter_SavedGames_Delete.locked = !enable;
}

setSlotEditMode(false);

/// @description New slot

// Early exit if locked
if (locked) exit;

// Request the user to input a name for the save slot.
// This is an async call and must be listened to on the Async Dialog event.
// This is done inside the 'Obj_GameCenter_SavedGames' object.
var msgId = get_string_async("Slot Name:","Slot#1")
Obj_GameCenter_SavedGames.msgId = msgId;
	
	
	
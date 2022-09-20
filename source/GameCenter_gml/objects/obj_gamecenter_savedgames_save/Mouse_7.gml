/// @description Save data

// Early exit if locked
if(locked) exit;
	
var data = [];

// Loop through all the points to be saved and store their poisition
// and image index inside an array.
with(Obj_GameCenter_SavedGames_Point)
{
	var pointData = { };
	pointData.x = x;
	pointData.y = y;
	pointData.image_index = image_index;
	
	array_push(data, pointData);
}

// Convert the array into a string
var dataJSON = json_stringify(data);

// Save the new data into the target save slot.
// This function call will save a string of data into a given slotId
// Data will be overwritten if existing or created if nonexistent.
// This function doesn't return any value but will trigger a Social Async event
// after the task is resolved.
GameCenter_SavedGames_Save(Obj_GameCenter_SavedGames.selected, dataJSON);



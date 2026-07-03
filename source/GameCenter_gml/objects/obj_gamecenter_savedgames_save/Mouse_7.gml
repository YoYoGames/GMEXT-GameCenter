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

// Create a buffer from the JSON string for binary-safe storage
var buff = buffer_create(string_length(dataJSON), buffer_fixed, 1);
buffer_write(buff, buffer_string, dataJSON);

// Save the new data into the target save slot.
// This function call will save binary data into a given slot.
// Data will be overwritten if existing or created if nonexistent.
// The result is delivered to the callback handled by Obj_GameCenter_SavedGames.
gamecenter_saved_games_save(Obj_GameCenter_SavedGames.selected, buff, Obj_GameCenter_SavedGames.handleSaveOrDelete);

// Clean up the buffer
buffer_delete(buff);



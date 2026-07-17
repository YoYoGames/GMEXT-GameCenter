/// @description Initialize variables

selected = "";
msgId = noone;

// This is a helper function that is used to control button states: when in
// slot edit mode some buttons need to be locked and others unlocked (this
// function handles that logic).
function setSlotEditMode(enable)
{
	with(Obj_GameCenter_SavedGames_New) locked = enable;
	with(Obj_GameCenter_SavedGames_Slot) locked = enable;

	Obj_GameCenter_SavedGames_Save.locked = !enable;
	Obj_GameCenter_SavedGames_Close.locked = !enable;
	Obj_GameCenter_SavedGames_Delete.locked = !enable;
}

// @callback for gamecenter_saved_games_fetch()
// Rebuilds the on-screen slot list from the fetched metadata. Replaces the
// "GameCenter_SavedGames_Fetch" case of the old Social Async event.
handleFetch = function(_result)
{
	// Early exit if not successful
	if (!_result.success) return;

	// Exit edit mode
	selected = "";
	instance_destroy(Obj_GameCenter_SavedGames_Point);
	instance_destroy(Obj_GameCenter_SavedGames_Slot);
	setSlotEditMode(false);

	// Loop through all the slots
	var _slots = _result.slots;
	var _count = array_length(_slots);
	for (var _i = 0; _i < _count; _i++)
	{
		var _slotData = _slots[_i];
		// Create a new instance of slot for each slot there is.
		with (instance_create_depth(bbox_left, y + _i*100, depth, Obj_GameCenter_SavedGames_Slot))
		{
			deviceName = _slotData.device_name;
			modificationDate = _slotData.modification_date;
			name = _slotData.name;
			text = name;
		}
	}
}

// @callback for gamecenter_saved_games_save() and gamecenter_saved_games_delete()
// After a successful save/delete we fetch the slots again to refresh the view.
// Replaces the "GameCenter_SavedGames_Save"/"GameCenter_SavedGames_Delete" cases
// of the old Social Async event.
handleSaveOrDelete = function(_result)
{
	// Early exit if not successful
	if (!_result.success) return;

	// Re-fetch from the Apple GameCenter servers all the save slots.
	gamecenter_saved_games_fetch(handleFetch);
}

// @callback for gamecenter_saved_games_data_request()
// First step: receives metadata containing handle_id and required_size.
// Fetches the actual data into a buffer, then unpacks it.
// Replaces the "GameCenter_SavedGames_GetData" case of the old Social Async event.
handleGetData = function(_result)
{
	// No native data handle exists when the asynchronous request fails.
	if (!_result.success)
	{
		return;
	}

	var _handle = _result.handle_id;

	// Validate the returned metadata before allocating the buffer.
	if (_handle < 0 || _result.required_size < 0)
	{
		if (_handle >= 0)
		{
			gamecenter_saved_games_data_release(_handle);
		}

		return;
	}

	// Create a buffer large enough to receive the complete saved-game payload.
	var _buffer = buffer_create(
		_result.required_size,
		buffer_fixed,
		1
	);

	if (_buffer < 0)
	{
		// The payload is still held by the native extension.
		gamecenter_saved_games_data_release(_handle);
		return;
	}

	// A successful fetch consumes the native handle.
	// A failed fetch leaves it valid, so it must be explicitly released.
	if (!gamecenter_saved_games_data_fetch(_handle, _buffer))
	{
		gamecenter_saved_games_data_release(_handle);
		buffer_delete(_buffer);
		return;
	}

	// The handle has now been consumed successfully.
	_handle = -1;

	// Read the JSON string from the buffer.
	buffer_seek(_buffer, buffer_seek_start, 0);
	var _dataJSON = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);

	// Parse and restore all saved instances.
	var _dataArray = json_parse(_dataJSON);
	var _count = array_length(_dataArray);

	for (var _i = 0; _i < _count; _i++)
	{
		var _objData = _dataArray[_i];

		var _ins = instance_create_depth(
			_objData.x,
			_objData.y,
			depth,
			Obj_GameCenter_SavedGames_Point
		);

		_ins.image_index = _objData.image_index;
	}

	// Enter the slot edit mode.
	setSlotEditMode(true);
};

// @callback for gamecenter_saved_games_resolve_conflict()
// Replaces the "GameCenter_SavedGames_ResolveConflict" case of the old event.
handleResolveConflict = function(_result)
{
	// Early exit if not successful
	if (!_result.success) return;

	// _result.conflict_id and _result.slots are available here.
	// Re-fetch from the Apple GameCenter servers to refresh after resolving.
	gamecenter_saved_games_fetch(handleFetch);
}

// @callback for gamecenter_saved_games_callback_subscribe()
// Triggered whenever a slot is modified or a saving conflict happens. Replaces
// the "GameCenter_SavedGames_DidModify"/"GameCenter_SavedGames_HasConflict"
// cases of the old Social Async event.
handleSavedGamesEvent = function(_result)
{
	switch (_result.type)
	{
		// @triggered whenever there is a modification to a save slot
		case "modified":

			// you can check slot and player information
			var _player = _result.player;
			var _slotData = _result.slot;
			break;

		// @triggered whenever there is a saving conflict
		case "conflict":

			// The conflict_id is a unique identifier of the conflict and can be
			// used to call 'gamecenter_saved_games_resolve_conflict' for solving
			// the respective conflict.
			var _conflictId = _result.conflict_id;
			var _slots = _result.slots;

			// Loop through all the slots
			var _count = array_length(_slots);
			for (var _i = 0; _i < _count; _i++)
			{
				var _slotData = _slots[_i];

				// Handle the slotData accordingly
			}

			// This requires selecting which data you will approve.
			// First, create a buffer with the chosen data (+1 for the NUL
			// terminator that buffer_string writes):
			// var _buff = buffer_create(string_byte_length(_dataToResolve) + 1, buffer_fixed, 1);
			// buffer_write(_buff, buffer_string, _dataToResolve);
			// gamecenter_saved_games_resolve_conflict(_conflictId, _buff, handleResolveConflict);
			// buffer_delete(_buff);
			break;
	}
}

// Subscribe to slot modification / conflict events.
gamecenter_saved_games_callback_subscribe(handleSavedGamesEvent);

// This function fetches from the Apple GameCenter servers all the save slots
// that were created. The result is delivered to the provided callback.
gamecenter_saved_games_fetch(handleFetch);

setSlotEditMode(false);

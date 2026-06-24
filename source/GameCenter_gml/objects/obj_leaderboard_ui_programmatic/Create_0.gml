/// @description Initialize variables

event_inherited()

textNormal = "Fetch Data"
textBusy = "Busy..."
text = textNormal
leaderboardID = ""

asyncBusy = false

// @callback for gamecenter_leaderboard_load()
// Replaces the "GameCenter_Leaderboard_Load" Social Async event. Receives a
// single result struct with the loaded entries (or error information).
on_load = function(_result)
{
	asyncBusy = false;

	var _s = "Game Center Leaderboard Data:\n";

	if (!_result.success)
	{
		_s += "Error:\n";
		_s += "Message: " + _result.error_message + "\n";
		_s += "Code: " + string(_result.error_code) + "\n";
	}
	else
	{
		// string: Use this string to display the name of your leaderboard:
		_s += "Leaderboard: " + _result.leaderboard_id + "\n";

		var _entries = _result.entries;
		var _count = array_length(_entries);
		_s += "Entries: " + string(_count) + ", rank displayName formattedScore date context rawScore:\n";
		for (var _i = 0; _i < _count; _i++)
		{
			var _e = _entries[_i];
			_s +=
				string(_e.rank) + " " +
				string(_e.player.display_name) + " " +
				string(_e.formatted_score) + " " +
				date_datetime_string(_e.date) + " " +
				string(_e.context) + " " +
				string(_e.score) + "\n";
		}

		// The local player's own entry (an empty struct when this player is not
		// present in the requested range).
		var _local = _result.local_entry;
		if (variable_struct_exists(_local, "rank") && _local.rank != -1)
		{
			_s += "--- This player is present: same format\n";
			_s +=
				// you can display this:
				string(_local.rank) + " " +
				string(_local.player.display_name) + " " +
				string(_local.formatted_score) + " " +
				date_datetime_string(_local.date) + " " +
				// you usually should NEVER display this: but it's a demo so who cares
				string(_local.context) + " " +
				string(_local.score) + "\n";
		}
	}

	// display the data in a small async window:
	_s += "\nData End.\n";
	show_message_async(_s);
}

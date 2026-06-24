/// @description Initialize variables

event_inherited()

textNormal = "Fetch Data"
textBusy = "Busy..."
text = textNormal

asyncBusy = false

// @callback for gamecenter_achievement_load()
// Replaces the "GameCenter_Achievement_Load" Social Async event. Receives a
// single result struct with the loaded achievements (or error information).
on_load = function(_result)
{
	asyncBusy = false;

	var _s = "Game Center Achievement Data:\n";

	if (!_result.success)
	{
		_s += "Error:\n";
		_s += "Message: " + _result.error_message + "\n";
		_s += "Code: " + string(_result.error_code) + "\n";
	}
	else
	{
		var _data = _result.achievements;
		for (var _i = 0; _i < array_length(_data); _i++)
		{
			var _achievement = _data[_i];
			_s += _achievement.identifier + ": " + string(_achievement.percent_complete) + "%\n";
		}
	}

	_s += "\nData End.\n";
	show_message_async(_s);
}

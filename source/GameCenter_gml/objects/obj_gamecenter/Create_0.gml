/// @description Initialize variables

// Make sure we randomize the seed
randomize();

// Helper used by the callbacks below to report any error that an asynchronous
// GameCenter task might return. Every callback receives a single result struct
// that always contains a "success" boolean and, when something goes wrong, an
// "error_code" and an "error_message".
gc_report = function(_label, _result)
{
	if (_result.success)
	{
		show_debug_message(_label + ": Success.");
		return true;
	}

	var _error = "Error: " + string(_result.error_code) + " - " + _result.error_message;
	show_debug_message(_label + ": " + _error);
	show_message_async("Failed " + _label + "\n" + _error);
	return false;
}

// @callback for gamecenter_local_player_authenticate()
// Replaces the "GameCenter_Authenticate" case of the old Social Async event.
on_authenticate = function(_result)
{
	gc_report("GameCenter_Authenticate", _result);
}

// @callback for gamecenter_view_callback_subscribe()
// Replaces the "GameCenter_PresentView_DidFinish" case of the old Social Async
// event. It is triggered whenever the achievement/leaderboard per-ID overlay
// (gamecenter_present_view_achievement/_leaderboard) is dismissed. This is a
// pure notification with no data, so the callback takes no arguments.
on_view_finished = function()
{
	// At this point we just dismissed a GameCenter's overlay view.
	show_debug_message("View DidFinish");
}

// @callback for gamecenter_access_point_present_with_state() / gamecenter_access_point_present()
// Triggered when the access-point-presented dashboard is dismissed. Same
// no-argument shape as on_view_finished above.
on_access_point_dismissed = function()
{
	show_debug_message("Access point view dismissed");
}

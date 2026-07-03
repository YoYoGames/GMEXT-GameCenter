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
// event. It is triggered whenever a GameCenter overlay view (default,
// achievements or leaderboards) is dismissed. The result struct is empty and
// just serves as a notification of dismissal (no success/error fields).
on_view_finished = function(_result)
{
	// At this point we just dismissed a GameCenter's overlay view.
	show_debug_message("View DidFinish");
}

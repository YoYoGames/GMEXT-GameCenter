/// @description Reset achievements

// This should be used only as a debug function since it resets all
// achievements collected by the player so far. This is something that you
// would not include in the final game (unless really intended).
// The result is delivered to the provided callback.
gamecenter_achievement_reset_all(function(_result)
{
	if (_result.success) show_debug_message("GameCenter_Achievement_ResetAll: Success.");
	else show_debug_message("GameCenter_Achievement_ResetAll failed: " + _result.error_message);
})

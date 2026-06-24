/// @description Report achievement

var newScore = irandom(999)
show_message_async("Your Score: " + string(newScore))

// This function allows to submit a new score to a leaderboard.
// The developer should pass in a leaderboardID, the new score and a context
// value (0 = no context). The result is delivered to the provided callback.
gamecenter_leaderboard_submit(leaderboardID, newScore, 0, function(_result)
{
	if (_result.success) show_debug_message("GameCenter_Leaderboard_Submit: Success.");
	else show_debug_message("GameCenter_Leaderboard_Submit failed: " + _result.error_message);
})

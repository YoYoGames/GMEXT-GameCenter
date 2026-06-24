/// @description Submit score

var _new_score = irandom(999);
show_message_async("Your Score: " + string(_new_score));

gamecenter_leaderboard_submit(leaderboardID, _new_score, 0, function(_result)
{
    if (_result.success)
    {
        show_debug_message(
            "Leaderboard score submitted: " + string(_result.score)
        );
    }
    else
    {
        show_message_async(
            "Failed to submit leaderboard score.\n" +
            "Error " + string(_result.error_code) + ": " + _result.error_message
        );
    }
});

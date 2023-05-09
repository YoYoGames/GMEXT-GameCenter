/// @description Report achievement

var newScore = irandom(999)
show_message_async("Your Score: " + string(newScore))

// This function allows to submit a new score to a leaderboard.
// The developer should pass in an leaderboardID and the new score.
// The function task will trigger a Async Social Event.
GameCenter_Leaderboard_Submit(leaderboardID, newScore,noone)

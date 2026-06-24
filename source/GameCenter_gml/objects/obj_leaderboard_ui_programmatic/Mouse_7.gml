/// @description Fetch data from leaderboard

// This function fetches data from a leaderboard without displaying the Game
// Center UI. It is only recommended if you want to guard against Daily Run
// cheating; for actual in-game display, the native Present() functions are
// recommended.
// The result is delivered to the 'on_load' callback defined in the Create event.
// NOTE: Some information such as Start Date, Next Date and Leaderboard Type are
//       ONLY available since iOS 14.0 and macOS 11.0, for older APIs a value of
//       -1 will be returned instead.
// NOTE 2: You cannot fetch more than 100 entries per operation. Please use sparingly.
asyncBusy = true;
gamecenter_leaderboard_load(leaderboardID, GameCenterLeaderboardTimeScope.AllTime, 1, 5, GameCenterLeaderboardPlayerScope.Global, on_load);

/// @description Fetch data from leaderboard

// This function fetches data from a leaderboard
// without displaying the Game Center UI.
// It is only recommended if you want to guard against Daily Run cheating,
// for actual in-game display, the native Present() functions are recommended.
// The function returns an async operation id, or 'GameCenter_Invalid' if the request could not be created.
// NOTE: Some information such as Start Date, Next Date and Leaderboard Type are ONLY
//       available since iOS 14.0 and macOS 11.0, for older APIs a constant 'GameCenter_Invalid' will be stored instead.
// For more information, please see Apple Developer Documentation on GameKit.
// NOTE 2: You cannot fetch more than 100 entries per operation. Please use sparingly.
GameCenter_Leaderboard_LoadGlobal(leaderboardID, GameCenter_Leaderboard_TimeScope_AllTime, 1, 5);


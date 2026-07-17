/// @description Show leaderboard

// This function shows a screen overlay with specific leaderboard information.
// Developer should also provide a timeScope and playerScope used to filter the leaderboard data.
// Dismissing the view triggers the subscribed view callback (set up in
// Obj_GameCenter via gamecenter_view_callback_subscribe).
gamecenter_present_view_leaderboard(leaderboardID, GameCenterLeaderboardTimeScope.AllTime, GameCenterLeaderboardPlayerScope.Global)

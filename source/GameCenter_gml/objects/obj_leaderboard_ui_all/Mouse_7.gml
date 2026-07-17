/// @description Show leaderboards

// This function shows a screen overlay with all leaderboards information via
// the access point (gamecenter_present_view_leaderboards was removed: it built
// on the now-deprecated GKGameCenterViewController with no benefit over this
// non-deprecated equivalent). The callback fires once the overlay is dismissed.
gamecenter_access_point_present_with_state(GameCenterViewState.Leaderboards, Obj_GameCenter.on_access_point_dismissed)

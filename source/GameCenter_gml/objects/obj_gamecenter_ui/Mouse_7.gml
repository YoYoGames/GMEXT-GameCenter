/// @description Show GameCenter UI

// This function shows the default GameCenter screen overlay via the access
// point (gamecenter_present_view_default was removed: it built on the
// now-deprecated GKGameCenterViewController with no benefit over this
// non-deprecated equivalent). The callback fires once the overlay is dismissed.
gamecenter_access_point_present_with_state(GameCenterViewState.Default, Obj_GameCenter.on_access_point_dismissed);

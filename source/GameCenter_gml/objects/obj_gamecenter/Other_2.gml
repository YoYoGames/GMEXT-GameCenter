/// @description Authenticate

// Subscribe to the view callback so we get notified whenever a GameCenter
// overlay view is dismissed (replaces the "GameCenter_PresentView_DidFinish"
// Social Async event).
gamecenter_view_callback_subscribe(on_view_finished);

// This is the first function that needs to be called before any other
// functionality can be used. This function will authenticate the users with
// their GameCenter account and will log them in. The result (success/error) is
// delivered to the provided callback instead of the old Social Async event.
gamecenter_local_player_authenticate(on_authenticate);

// Try to setup the Game Center access point.
gamecenter_access_point_set_active(true);
gamecenter_access_point_set_location(GameCenterAccessPointLocation.BottomLeading);
gamecenter_access_point_set_show_highlights(true);

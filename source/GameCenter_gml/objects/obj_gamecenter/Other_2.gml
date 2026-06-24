/// @description Authenticate and subscribe to Game Center events

// Subscribe once to the callback fired after a native Game Center view closes.
gamecenter_view_callback_subscribe(function(_result)
{
    show_debug_message("Game Center view finished: " + json_stringify(_result));
});

// Authenticate before using the remaining Game Center functionality.
gamecenter_local_player_authenticate(function(_result)
{
    show_debug_message("Game Center authentication: " + json_stringify(_result));

    if (!_result.success)
    {
        show_message_async(
            "Game Center authentication failed.\n" +
            "Error " + string(_result.error_code) + ": " + _result.error_message
        );
        exit;
    }

    show_debug_message("Authentication state: " + _result.authentication_state);
    show_debug_message("Authenticated: " + string(_result.authenticated));
});

// Try to set up the Game Center access point.
gamecenter_access_point_set_active(true);
gamecenter_access_point_set_location(GameCenterAccessPointLocation.BottomLeading);
gamecenter_access_point_set_show_highlights(true);

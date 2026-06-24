/// @description Report achievement

gamecenter_achievement_report(achievement_id, 100, true, function(_result)
{
    if (_result.success)
    {
        show_debug_message("Achievement reported: " + _result.identifier);
    }
    else
    {
        show_message_async(
            "Failed to report achievement.\n" +
            "Error " + string(_result.error_code) + ": " + _result.error_message
        );
    }
});

// Show the specific achievement when needed:
// gamecenter_present_view_achievement(achievement_id);

/// @description Reset achievements

gamecenter_achievement_reset_all(function(_result)
{
    if (_result.success)
    {
        show_debug_message("All achievements were reset.");
    }
    else
    {
        show_message_async(
            "Failed to reset achievements.\n" +
            "Error " + string(_result.error_code) + ": " + _result.error_message
        );
    }
});

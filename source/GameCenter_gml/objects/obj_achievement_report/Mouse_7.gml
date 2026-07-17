/// @description Report achievement

// This function allows to create a report on an achievement.
// The developer should pass in an achievementId, a completion percentage and
// whether to show the completion banner. The result is delivered to the
// provided callback.
gamecenter_achievement_report(achievement_id, 100, true, function(_result)
{
	if (_result.success) show_debug_message("GameCenter_Achievement_Report: Success.");
	else show_debug_message("GameCenter_Achievement_Report failed: " + _result.error_message);
});

// This function shows a screen overlay with specific achievement information.
// Dismissing the view triggers the subscribed view callback.
//gamecenter_present_view_achievement(achievement_id);

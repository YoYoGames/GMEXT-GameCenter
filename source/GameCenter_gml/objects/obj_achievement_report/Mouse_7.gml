/// @description Report achievement

// This function allows to create report on an achievement.
// The developer should pass in an achievementId and a completion percentage.
// The function task will trigger a Async Social Event.
GameCenter_Achievement_Report(achievement_id, 100, true);

// This function shows a screen overlay with specific achievement information
// The function task will trigger a Async Social Event when dismissing the view.
//GameCenter_PresentView_Achievement(achievement_id);

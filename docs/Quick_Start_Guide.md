@title Quick Start Guide

# Quick Start Guide

This section aims to deliver an easy and simple set of examples that should help you migrate your project from a previous version of the GameCenter extension to its latest version. The first thing to notice is that GameCenter functionality used to be part of the runtime and all the included functions were named "**achievement_\***"; these were renamed to "**GameCenter_\***" and also separated into categories to better organize them and provide a cleaner look to the code.

## Signing In/Out

The first thing to look for when creating an Apple GameCenter GameMaker project is signing in to a GameCenter account.

### Function Mappings

Even though not all old functions map perfectly into the new API, the following list should get you started with some of the changes (check the section below for more details):

* ${function.GameCenter_LocalPlayer_IsAuthenticated} ⇔ achievement_login_status()
* ${function.GameCenter_LocalPlayer_Authenticate} ⇔ achievement_login()
* ${function.GameCenter_LocalPlayer_GetInfo} gets information on the local player.

### Old Version

```gml
// In the previous version you would check the achievement status and if not
// signed in, you were required to log in.
if (!achievement_login_status()) {
	achievement_login();
}
```

This function would then trigger a callback ${event.social}, where the ${var.async_load} map would contain an "id" key of `achievement_our_info` and also some account information under "name" and "playerId".

### New Version

```gml
// In the new version you can use the following code to check connection and
// connect to the GameCenter account.
if (!GameCenter_LocalPlayer_IsAuthenticated()) {
	GameCenter_LocalPlayer_Authenticate();
}
```

This function will then trigger a callback ${event.social}, where the ${var.async_load} map would contain a "type" key with the value `GameCenter_Authenticate` and a "success" key that can have a value of `true` or `false` (depending on whether or not the function was successful).

```gml
// After signing in if you need to query player information, you can do so
// by using the method 'GameCenter_LocalPlayer_GetInfo'.
var playerInfoJSON = GameCenter_LocalPlayer_GetInfo();
var playerInfo = json_parse(playerInfoJSON);
```

The player information after being parsed into a struct contains a lot of details about the account (see ${struct.PlayerJSON}).

## Leaderboards

One of the features provided by Apple GameCenter API is the creation of and the interaction with leaderboards. Leaderboards can be created using the Apple Developer Dashboard (see ${page.setup}) and you can view them and submit values to them during runtime.

### Function Mappings

Even though not all old functions map perfectly into the new API, the following list should get you started with some of the changes (check the section below for more details):

* ${function.GameCenter_Leaderboard_Submit} ⇔ achievement_post_score()
* ${function.GameCenter_PresentView_Leaderboards} ⇔ achievement_show_leaderboards()
* ${function.GameCenter_PresentView_Leaderboard} shows a specific leaderboard.

### Old Version

```gml
// In the previous version you would use the leaderboards as follows.
// To submit a value to a leaderboard you would do:
achievement_post_score(global.leaderboardId, score);
```

This function would then trigger a callback ${event.social}, where the ${var.async_load} map would contain an "id" key of `achievement_post_score_result` with some other keys with information regarding your current post to the leaderboard.

```gml
// Then if you wanted to see the leaderboards you could just use the following
// line of code.
achievement_show_leaderboards();
```

### New Version

```gml
// In the new version you can submit to a leaderboard using the code sample:
GameCenter_Leaderboard_Submit(global.leaderboardId, score);
```

This function works asynchronously and triggers a ${event.social} callback upon completion with submission result information (${func.GameCenter_Leaderboard_Submit}).

```gml
// If you need to show the leaderboard to the user you can now do so with the
// help of one of two functions:

// Show a single leaderboard (GameCenter_PresentView_Leaderboard)
GameCenter_PresentView_Leaderboard(leaderboardId, timeScope, playerScope);

// Show all the leaderboards
GameCenter_PresentView_Leaderboards();
```

## Achievements

One of the features provided by Apple GameCenter API is creation of and the interaction with achievements. Achievements can be created using the Apple Developer Dashboard (see ${page.setup}) and you can view them and submit values to them during runtime.

### Function Mappings

Even though not all old functions map perfectly into the new API, the following list should get you started with some of the changes (check the section below for more details):

* ${function.GameCenter_Achievement_Report} ⇔ achievement_post()
* ${function.GameCenter_Achievement_ResetAll} ⇔ achievement_reset()
* ${function.GameCenter_PresentView_Achievements} ⇔ achievement_show_achievements()
* ${function.GameCenter_PresentView_Achievement} shows a specific leaderboard.

### Old Version

In previous versions you could reveal, increment, post and show in-game achievements using the functions given below:

```gml
// After successfully connecting to the Google Play account you could perform
// the following operations:
achievement_reveal(achievementId);
achievement_post(achievementId, percent);

achievement_increment(incrementalAchievementId, amount);
achievement_show_achievements();
```

The code above would first reveal the achievement to the user (if it was a hidden achievement), then you could post a value to an achievement which would be a percentage value (0 - incomplete, 100 - complete); you could also increment the achievement value (if it was an incremental achievement) and finally you could show the achievements to the user.

### New Version

In the new version you can report achievement completion using the following code:

```gml
GameCenter_Achievement_Report(achievementId, percent);
GameCenter_PresentView_Achievement(achievementId); // Show single
GameCenter_PresentView_Achievements(); // Show all
```

The migration in the example above is very simple and straightforward. Please take into consideration that the code above will produce ${event.social} callbacks with additional information regarding the task completion (${module.achievement}).

## Save Games

This functionality is completely new and as such there is no migration guide, however you can experiment with it using the provided demo sample. This section aims to deliver a clean explanation of the code layout used for the demo.

> [!NOTE]
> This feature will only work if the end user's iOS device iCloud Drive is turned on. This feature also requires the developer's project to have a dedicated container defined for the app (defined on the Apple's [CloudKit Dashboard](https://icloud.developer.apple.com/dashboard/home)).

### Objects

1. Each component used in the sample is represented by an object (stored inside the folder: `GameCenter` → `Objects` → `SavedGames`)
2. The object `Obj_GameCenter_SavedGames` is where the ${event.social} callbacks are handled.
3. The object `Obj_GameCenter_Point` is used as a placeholder representation of game data to be saved.
4. The object `Obj_GameCenter_Slot` represents a saved slot that can be clicked to enter slot edit mode.
5. The remaining objects inside the folder are buttons that the user can interact with.

### Demo Workflow

1. When you create a new slot (**New Save Slot** button) a prompt dialog to name the slot is displayed. The callback to handle the returned value and entering slot edit mode is inside the `Obj_GameCenter_SavedGames` dialog async event.
2. In the edit mode we can move objects around and tap the icon to change it. After editing we can close edit mode ignoring new changes to the data or **save** the changes ${function.GameCenter_SavedGames_Save}, optionally we can also **delete** the slot (${function.GameCenter_SavedGames_Delete}).
3. After saving the new slot we **fetch** (${function.GameCenter_SavedGames_Fetch}) the slot data from Apple GameCenter servers.
4. The newly created slot will now appear on screen. If you click it, we will request to **get** its data (${function.GameCenter_SavedGames_GetData}) and enter its edit mode.
@title Quick Start Guide

# Quick Start Guide

This guide is a quick tour of the Apple GameCenter extension. It only works on **iOS and macOS** (it wraps Apple's GameKit framework), so make sure you have completed the ${page.setup} steps first.

Two things to keep in mind throughout:

* You must **authenticate the local player** before using any other feature.
* Every asynchronous function takes a `callback` function as its last argument. The callback is called with a **single struct** as the argument holding the result — e.g. `function(_result) { ... }`. Each result struct has a `success` member, plus `error_code` / `error_message` when something goes wrong.

## Authentication

Call ${function.gamecenter_local_player_authenticate} once, early in your game, and check the result in the callback:

```gml
gamecenter_local_player_authenticate(function(_result) {
    if (_result.authenticated) {
        show_debug_message($"Signed in as {_result.player.display_name}");
    } else {
        show_debug_message($"Not signed in: {_result.error_message}");
    }
});
```

> [!NOTE]
> GameKit re-invokes this callback whenever the authentication state changes (for example when the app returns to the foreground, or the player signs out and back in). Treat it as a **recurring** callback — don't free state after the first call.

You can also query the current state synchronously, for example with ${function.gamecenter_local_player_is_authenticated} or ${function.gamecenter_local_player_get_info}. See the ${module.localplayer} module for the full list.

## Presenting the Game Center UI

The general overlays (dashboard, achievements list, leaderboards list) are shown through the Game Center **access point** (${module.accesspoint}). Each call takes its own callback, fired with no arguments once the player closes the overlay:

```gml
gamecenter_access_point_present_with_state(GameCenterViewState.Default, function() {
    show_debug_message("Game Center overlay was closed");
});

gamecenter_access_point_present_with_state(GameCenterViewState.Achievements, function() {
    show_debug_message("Achievements overlay was closed");
});

gamecenter_access_point_present_with_state(GameCenterViewState.Leaderboards, function() {
    show_debug_message("Leaderboards overlay was closed");
});
```

To deep-link a **specific** achievement or leaderboard by ID, use the ${module.presentview} functions instead. These subscribe **once** to a shared dismissal notification (also called with no arguments), then present the detail view you need:

```gml
// Subscribe once (e.g. at startup)
gamecenter_view_callback_subscribe(function() {
    show_debug_message("Game Center overlay was closed");
});

// Later, present a specific achievement or leaderboard
gamecenter_present_view_achievement("com.company.game.achievement.first_win");
gamecenter_present_view_leaderboard("my_leaderboard", GameCenterLeaderboardTimeScope.AllTime, GameCenterLeaderboardPlayerScope.Global);
```

## Leaderboards

Submit a score with ${function.gamecenter_leaderboard_submit} and read entries back with ${function.gamecenter_leaderboard_load}. Leaderboard IDs come from App Store Connect (see ${page.setup}).

```gml
// Submit a score
gamecenter_leaderboard_submit("my_leaderboard", 1500, 0, function(_result) {
    if (_result.success) {
        show_debug_message($"Submitted {_result.score}");
    }
});

// Load the top 10 all-time global entries
gamecenter_leaderboard_load("my_leaderboard", GameCenterLeaderboardTimeScope.AllTime, 1, 10, GameCenterLeaderboardPlayerScope.Global, function(_result) {
    if (!_result.success) return;
    for (var i = 0; i < array_length(_result.entries); i++) {
        var _entry = _result.entries[i];
        show_debug_message($"#{_entry.rank} {_entry.player.display_name}: {_entry.formatted_score}");
    }
});
```

> [!NOTE]
> Leaderboard scores are integers; a fractional `score` is truncated (configure a formatter in App Store Connect and submit a scaled integer if you need decimals). Ranks are 1-based and a single load is limited to 100 entries.

See the ${module.leaderboard} module for the ${constant.GameCenterLeaderboardTimeScope} / ${constant.GameCenterLeaderboardPlayerScope} enums and the full result structure.

## Achievements

Report progress with ${function.gamecenter_achievement_report}, list the player's progress with ${function.gamecenter_achievement_load}, and (for testing) wipe progress with ${function.gamecenter_achievement_reset_all}. Achievement IDs come from App Store Connect.

```gml
// Report an achievement as complete and show the system banner
gamecenter_achievement_report("my_achievement", 100, true, function(_result) {
    if (_result.success) {
        show_debug_message("Achievement reported");
    }
});

// Load the player's achievement progress
gamecenter_achievement_load(function(_result) {
    if (!_result.success) return;
    for (var i = 0; i < array_length(_result.achievements); i++) {
        var _a = _result.achievements[i];
        show_debug_message($"{_a.identifier}: {_a.percent_complete}%");
    }
});
```

> [!NOTE]
> `percent_complete` is a whole number in the range 0–100.

See the ${module.achievement} module for the full list.

## Saved Games

Saved games are stored in the player's iCloud account (so iCloud must be enabled, see ${page.setup}). Data is a **plain UTF-8 string** — to store complex data, encode it (for example with `json_stringify`) before saving.

Subscribe to the saved-games event stream to be told about external modifications and conflicts:

```gml
gamecenter_saved_games_callback_subscribe(function(_event) {
    switch (_event.type) {
        case "modified":
            // A save was changed on another device
            break;

        case "conflict":
            // Two devices wrote the same save name while offline.
            // Resolve it by writing the data you want to keep.
            gamecenter_saved_games_resolve_conflict(_event.conflict_id, "the correct data", function(_result) {
                show_debug_message("Conflict resolved");
            });
            break;
    }
});
```

> [!NOTE]
> A conflict event is delivered **once per save name**, so each `conflict_id` corresponds to a single saved game.

Save, fetch and read slots:

```gml
// Save (creates the slot if it doesn't exist, overwrites if it does)
var _dataJSON = json_stringify({ level: 5, hp: 80 });
var _saveBuff = buffer_create(string_byte_length(_dataJSON) + 1, buffer_fixed, 1);
buffer_write(_saveBuff, buffer_string, _dataJSON);

gamecenter_saved_games_save("slot1", _saveBuff, function(_result) {
    if (_result.success) {
        // Fetch the list of all slots
        gamecenter_saved_games_fetch(function(_fetch) {
            show_debug_message($"You have {array_length(_fetch.slots)} saved game(s)");
        });
    }
});

buffer_delete(_saveBuff);

// Read a slot's data back: the callback carries metadata only, so fetch the
// bytes into a correctly-sized buffer once you know required_size.
gamecenter_saved_games_data_request("slot1", function(_result) {
    if (!_result.success) return;

    var _readBuff = buffer_create(_result.required_size, buffer_fixed, 1);
    if (gamecenter_saved_games_data_fetch(_result.handle_id, _readBuff)) {
        buffer_seek(_readBuff, buffer_seek_start, 0);
        var _data = json_parse(buffer_read(_readBuff, buffer_string));
        show_debug_message($"Loaded level {_data.level}");
    }
    buffer_delete(_readBuff);
});
```

See the ${module.savedgames} module for every function and result struct.

## Access Point

The access point is the floating Game Center badge. Position it, then make it active (requires iOS 14 / macOS 11):

```gml
gamecenter_access_point_set_location(GameCenterAccessPointLocation.TopLeading);
gamecenter_access_point_set_active(true);
```

See the ${module.accesspoint} module for the full list of access point controls.

/// @description Fetch data from leaderboard

if (asyncBusy) exit;

asyncBusy = true;

gamecenter_leaderboard_load(
    leaderboardID,
    GameCenterLeaderboardTimeScope.AllTime,
    1,
    5,
    GameCenterLeaderboardPlayerScope.Global,
    function(_result)
    {
        asyncBusy = false;

        var _text = "Game Center Leaderboard Data:\n";

        if (!_result.success)
        {
            _text += "Error:\n";
            _text += "Message: " + _result.error_message + "\n";
            _text += "Code: " + string(_result.error_code) + "\n";
        }
        else
        {
            _text += "Leaderboard: " + _result.leaderboard_id + "\n";

            var _entries = _result.entries;
            var _entry_count = array_length(_entries);
            _text += "Entries: " + string(_entry_count) +
                ", rank display_name formatted_score date context score:\n";

            for (var _i = 0; _i < _entry_count; ++_i)
            {
                var _entry = _entries[_i];
                _text +=
                    string(_entry.rank) + " " +
                    _entry.player.display_name + " " +
                    _entry.formatted_score + " " +
                    date_datetime_string(_entry.date) + " " +
                    string(_entry.context) + " " +
                    string(_entry.score) + "\n";
            }

            var _local_entry = _result.local_entry;
            if (is_struct(_local_entry) && variable_struct_exists(_local_entry, "rank"))
            {
                _text += "--- This player is present: same format\n";
                _text +=
                    string(_local_entry.rank) + " " +
                    _local_entry.player.display_name + " " +
                    _local_entry.formatted_score + " " +
                    date_datetime_string(_local_entry.date) + " " +
                    string(_local_entry.context) + " " +
                    string(_local_entry.score) + "\n";
            }
        }

        _text += "\nData End.\n";
        show_message_async(_text);
    }
);

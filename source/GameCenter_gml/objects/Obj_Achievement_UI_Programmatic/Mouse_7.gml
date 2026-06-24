/// @description Fetch achievement data

if (asyncBusy) exit;

asyncBusy = true;

gamecenter_achievement_load(function(_result)
{
    asyncBusy = false;

    var _text = "Game Center Achievement Data:\n";

    if (!_result.success)
    {
        _text += "Error:\n";
        _text += "Message: " + _result.error_message + "\n";
        _text += "Code: " + string(_result.error_code) + "\n";
    }
    else
    {
        var _achievements = _result.achievements;
        var _count = array_length(_achievements);

        for (var _i = 0; _i < _count; ++_i)
        {
            var _achievement = _achievements[_i];
            _text += _achievement.identifier + ": " +
                string(_achievement.percent_complete) + "%\n";
        }
    }

    _text += "\nData End.\n";
    show_message_async(_text);
});

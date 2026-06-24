/// @description Save data

if (locked) exit;

var _data = [];

with (Obj_GameCenter_SavedGames_Point)
{
    array_push(_data, {
        x: x,
        y: y,
        image_index: image_index
    });
}

var _manager = Obj_GameCenter_SavedGames;
var _data_json = json_stringify(_data);

gamecenter_saved_games_save(_manager.selected, _data_json, function(_result)
{
    if (!_result.success)
    {
        _manager.show_saved_game_error("Save game", _result);
        exit;
    }

    _manager.fetch_saved_game_slots();
});

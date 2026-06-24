/// @description Delete slot

if (locked) exit;

var _manager = Obj_GameCenter_SavedGames;
var _name = _manager.selected;

gamecenter_saved_games_delete(_name, function(_result)
{
    if (!_result.success)
    {
        _manager.show_saved_game_error("Delete saved game", _result);
        exit;
    }

    _manager.selected = "";
    instance_destroy(Obj_GameCenter_SavedGames_Point);
    _manager.fetch_saved_game_slots();
});

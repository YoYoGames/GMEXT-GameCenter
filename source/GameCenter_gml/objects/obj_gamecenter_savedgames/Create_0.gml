/// @description Initialize variables and Game Center saved-game callbacks

selected = "";
msgId = noone;

function show_saved_game_error(_operation, _result)
{
    show_message_async(
        _operation + " failed.\n" +
        "Error " + string(_result.error_code) + ": " + _result.error_message
    );
}

function rebuild_saved_game_slots(_slots)
{
    selected = "";
    instance_destroy(Obj_GameCenter_SavedGames_Point);
    instance_destroy(Obj_GameCenter_SavedGames_Slot);
    setSlotEditMode(false);

    var _count = array_length(_slots);
    for (var _i = 0; _i < _count; ++_i)
    {
        var _slot_data = _slots[_i];
        var _slot = instance_create_depth(
            bbox_left,
            y + _i * 100,
            depth,
            Obj_GameCenter_SavedGames_Slot
        );

        _slot.deviceName = _slot_data.device_name;
        _slot.modificationDate = _slot_data.modification_date;
        _slot.name = _slot_data.name;
        _slot.text = _slot.name;
    }
}

function fetch_saved_game_slots()
{
    gamecenter_saved_games_fetch(function(_result)
    {
        if (!_result.success)
        {
            show_saved_game_error("Fetch saved games", _result);
            exit;
        }

        rebuild_saved_game_slots(_result.slots);
    });
}

function load_saved_game_data(_name)
{
    gamecenter_saved_games_get_data(_name, function(_result)
    {
        if (!_result.success)
        {
            show_saved_game_error("Load saved game", _result);
            exit;
        }

        instance_destroy(Obj_GameCenter_SavedGames_Point);

        var _data_array = json_parse(_result.data);
        var _count = array_length(_data_array);
        for (var _i = 0; _i < _count; ++_i)
        {
            var _point_data = _data_array[_i];
            var _point = instance_create_depth(
                _point_data.x,
                _point_data.y,
                depth,
                Obj_GameCenter_SavedGames_Point
            );
            _point.image_index = _point_data.image_index;
        }

        setSlotEditMode(true);
    });
}

// These are listener events from GKLocalPlayer, not operation callbacks.
gamecenter_saved_games_callback_subscribe(function(_event)
{
    switch (_event.type)
    {
        case "modified":
            show_debug_message("Saved game modified: " + _event.slot.name);
            break;

        case "conflict":
            show_debug_message(
                "Saved-game conflict " + string(_event.conflict_id) +
                " with " + string(array_length(_event.slots)) + " versions."
            );
            // Resolve after choosing the preferred data:
            // gamecenter_saved_games_resolve_conflict(
            //     _event.conflict_id,
            //     preferred_data,
            //     function(_result) { ... }
            // );
            break;
    }
});

// This helper controls which buttons are available while editing a slot.
function setSlotEditMode(enable)
{
    Obj_GameCenter_SavedGames_New.locked = enable;
    with (Obj_GameCenter_SavedGames_Slot) locked = enable;

    Obj_GameCenter_SavedGames_Save.locked = !enable;
    Obj_GameCenter_SavedGames_Close.locked = !enable;
    Obj_GameCenter_SavedGames_Delete.locked = !enable;
}

setSlotEditMode(false);
fetch_saved_game_slots();

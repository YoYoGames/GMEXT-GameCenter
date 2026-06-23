// ##### extgen :: Auto-generated file do not edit!! #####

// #####################################################################
// # Macros
// #####################################################################

// #####################################################################
// # Enums
// #####################################################################

enum GameCenterLeaderboardTimeScope
{
    Today = 0,
    Week = 1,
    AllTime = 2
}

enum GameCenterLeaderboardPlayerScope
{
    Global = 0,
    FriendsOnly = 1
}

enum GameCenterAccessPointLocation
{
    TopLeading = 0,
    TopTrailing = 1,
    BottomLeading = 2,
    BottomTrailing = 3
}

enum GameCenterAccessPointCoordinate
{
    X = 0,
    Y = 1,
    Width = 2,
    Height = 3
}

enum GameCenterViewState
{
    Default = -1,
    Leaderboards = 0,
    Achievements = 1,
    Challenges = 2,
    LocalPlayerProfile = 3,
    Dashboard = 4,
    LocalPlayerFriendsList = 5
}

// #####################################################################
// # Constructors
// #####################################################################

// #####################################################################
// # Codecs
// #####################################################################

// #####################################################################
// # Functions
// #####################################################################

/**
 * @param {Function} _callback
 */
function gamecenter_view_callback_subscribe(_callback)
{
    static __dispatcher = __GMGameCenter_get_dispatcher();

    var __args_buffer = __ext_core_get_args_buffer();

    // param: _callback, type: Function
    if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
    var _callback_handle = __ext_core_function_register(_callback, __dispatcher);
    buffer_write(__args_buffer, buffer_u64, _callback_handle);

    var _return_value = __gamecenter_view_callback_subscribe(buffer_get_address(__args_buffer), buffer_tell(__args_buffer));

    return _return_value;
}

// Skipping function gamecenter_present_view_default (no wrapper is required)


// Skipping function gamecenter_present_view_achievements (no wrapper is required)


// Skipping function gamecenter_present_view_achievement (no wrapper is required)


// Skipping function gamecenter_present_view_leaderboards (no wrapper is required)


/**
 * @param {String} _leaderboard_id
 * @param {Enum.GameCenterLeaderboardTimeScope} _time_scope
 * @param {Enum.GameCenterLeaderboardPlayerScope} _player_scope
 * @returns {Bool} 
 */
function gamecenter_present_view_leaderboard(_leaderboard_id, _time_scope, _player_scope)
{
    var __args_buffer = __ext_core_get_args_buffer();

    // param: _leaderboard_id, type: String
    if (!is_string(_leaderboard_id)) show_error($"{_GMFUNCTION_} :: _leaderboard_id expected string", true);
    buffer_write(__args_buffer, buffer_u32, string_byte_length(_leaderboard_id));
    buffer_write(__args_buffer, buffer_string, _leaderboard_id);

    // param: _time_scope, type: enum GameCenterLeaderboardTimeScope

    if (!is_numeric(_time_scope)) show_error($"{_GMFUNCTION_} :: _time_scope expected number", true);
    buffer_write(__args_buffer, buffer_s32, _time_scope);

    // param: _player_scope, type: enum GameCenterLeaderboardPlayerScope

    if (!is_numeric(_player_scope)) show_error($"{_GMFUNCTION_} :: _player_scope expected number", true);
    buffer_write(__args_buffer, buffer_s32, _player_scope);

    var _return_value = __gamecenter_present_view_leaderboard(buffer_get_address(__args_buffer), buffer_tell(__args_buffer));

    return _return_value;
}

/**
 * @param {Function} _callback
 */
function gamecenter_local_player_authenticate(_callback)
{
    static __dispatcher = __GMGameCenter_get_dispatcher();

    var __args_buffer = __ext_core_get_args_buffer();

    // param: _callback, type: Function
    if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
    var _callback_handle = __ext_core_function_register(_callback, __dispatcher);
    buffer_write(__args_buffer, buffer_u64, _callback_handle);

    var _return_value = __gamecenter_local_player_authenticate(buffer_get_address(__args_buffer), buffer_tell(__args_buffer));

    return _return_value;
}

// Skipping function gamecenter_local_player_is_authenticated (no wrapper is required)


// Skipping function gamecenter_local_player_is_underage (no wrapper is required)


// Skipping function gamecenter_local_player_is_multiplayer_gaming_restricted (no wrapper is required)


// Skipping function gamecenter_local_player_is_personalized_communication_restricted (no wrapper is required)


/**
 * @returns {Any} 
 */
function gamecenter_local_player_get_info()
{
    var __ret_buffer = __ext_core_get_ret_buffer();

    var _return_value = __gamecenter_local_player_get_info(buffer_get_address(__ret_buffer), buffer_get_size(__ret_buffer));

    var _result = undefined;
    _result = __ext_core_buffer_unmarshal_value(__ret_buffer, __decoders);
    return _result;
}

/**
 * @param {Function} _callback
 */
function gamecenter_saved_games_callback_subscribe(_callback)
{
    static __dispatcher = __GMGameCenter_get_dispatcher();

    var __args_buffer = __ext_core_get_args_buffer();

    // param: _callback, type: Function
    if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
    var _callback_handle = __ext_core_function_register(_callback, __dispatcher);
    buffer_write(__args_buffer, buffer_u64, _callback_handle);

    var _return_value = __gamecenter_saved_games_callback_subscribe(buffer_get_address(__args_buffer), buffer_tell(__args_buffer));

    return _return_value;
}

/**
 * @param {Function} _callback
 */
function gamecenter_saved_games_fetch(_callback)
{
    static __dispatcher = __GMGameCenter_get_dispatcher();

    var __args_buffer = __ext_core_get_args_buffer();

    // param: _callback, type: Function
    if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
    var _callback_handle = __ext_core_function_register(_callback, __dispatcher);
    buffer_write(__args_buffer, buffer_u64, _callback_handle);

    var _return_value = __gamecenter_saved_games_fetch(buffer_get_address(__args_buffer), buffer_tell(__args_buffer));

    return _return_value;
}

/**
 * @param {String} _name
 * @param {String} _data
 * @param {Function} _callback
 */
function gamecenter_saved_games_save(_name, _data, _callback)
{
    static __dispatcher = __GMGameCenter_get_dispatcher();

    var __args_buffer = __ext_core_get_args_buffer();

    // param: _name, type: String
    if (!is_string(_name)) show_error($"{_GMFUNCTION_} :: _name expected string", true);
    buffer_write(__args_buffer, buffer_u32, string_byte_length(_name));
    buffer_write(__args_buffer, buffer_string, _name);

    // param: _data, type: String
    if (!is_string(_data)) show_error($"{_GMFUNCTION_} :: _data expected string", true);
    buffer_write(__args_buffer, buffer_u32, string_byte_length(_data));
    buffer_write(__args_buffer, buffer_string, _data);

    // param: _callback, type: Function
    if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
    var _callback_handle = __ext_core_function_register(_callback, __dispatcher);
    buffer_write(__args_buffer, buffer_u64, _callback_handle);

    var _return_value = __gamecenter_saved_games_save(buffer_get_address(__args_buffer), buffer_tell(__args_buffer));

    return _return_value;
}

/**
 * @param {String} _name
 * @param {Function} _callback
 */
function gamecenter_saved_games_delete(_name, _callback)
{
    static __dispatcher = __GMGameCenter_get_dispatcher();

    var __args_buffer = __ext_core_get_args_buffer();

    // param: _name, type: String
    if (!is_string(_name)) show_error($"{_GMFUNCTION_} :: _name expected string", true);
    buffer_write(__args_buffer, buffer_u32, string_byte_length(_name));
    buffer_write(__args_buffer, buffer_string, _name);

    // param: _callback, type: Function
    if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
    var _callback_handle = __ext_core_function_register(_callback, __dispatcher);
    buffer_write(__args_buffer, buffer_u64, _callback_handle);

    var _return_value = __gamecenter_saved_games_delete(buffer_get_address(__args_buffer), buffer_tell(__args_buffer));

    return _return_value;
}

/**
 * @param {String} _name
 * @param {Function} _callback
 */
function gamecenter_saved_games_get_data(_name, _callback)
{
    static __dispatcher = __GMGameCenter_get_dispatcher();

    var __args_buffer = __ext_core_get_args_buffer();

    // param: _name, type: String
    if (!is_string(_name)) show_error($"{_GMFUNCTION_} :: _name expected string", true);
    buffer_write(__args_buffer, buffer_u32, string_byte_length(_name));
    buffer_write(__args_buffer, buffer_string, _name);

    // param: _callback, type: Function
    if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
    var _callback_handle = __ext_core_function_register(_callback, __dispatcher);
    buffer_write(__args_buffer, buffer_u64, _callback_handle);

    var _return_value = __gamecenter_saved_games_get_data(buffer_get_address(__args_buffer), buffer_tell(__args_buffer));

    return _return_value;
}

/**
 * @param {Real} _conflict_id
 * @param {String} _data
 * @param {Function} _callback
 */
function gamecenter_saved_games_resolve_conflict(_conflict_id, _data, _callback)
{
    static __dispatcher = __GMGameCenter_get_dispatcher();

    var __args_buffer = __ext_core_get_args_buffer();

    // param: _conflict_id, type: Float64
    if (!is_numeric(_conflict_id)) show_error($"{_GMFUNCTION_} :: _conflict_id expected number", true);
    buffer_write(__args_buffer, buffer_f64, _conflict_id);

    // param: _data, type: String
    if (!is_string(_data)) show_error($"{_GMFUNCTION_} :: _data expected string", true);
    buffer_write(__args_buffer, buffer_u32, string_byte_length(_data));
    buffer_write(__args_buffer, buffer_string, _data);

    // param: _callback, type: Function
    if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
    var _callback_handle = __ext_core_function_register(_callback, __dispatcher);
    buffer_write(__args_buffer, buffer_u64, _callback_handle);

    var _return_value = __gamecenter_saved_games_resolve_conflict(buffer_get_address(__args_buffer), buffer_tell(__args_buffer));

    return _return_value;
}

/**
 * @param {String} _leaderboard_id
 * @param {Real} _score
 * @param {Real} _context
 * @param {Function} _callback
 */
function gamecenter_leaderboard_submit(_leaderboard_id, _score, _context, _callback)
{
    static __dispatcher = __GMGameCenter_get_dispatcher();

    var __args_buffer = __ext_core_get_args_buffer();

    // param: _leaderboard_id, type: String
    if (!is_string(_leaderboard_id)) show_error($"{_GMFUNCTION_} :: _leaderboard_id expected string", true);
    buffer_write(__args_buffer, buffer_u32, string_byte_length(_leaderboard_id));
    buffer_write(__args_buffer, buffer_string, _leaderboard_id);

    // param: _score, type: Float64
    if (!is_numeric(_score)) show_error($"{_GMFUNCTION_} :: _score expected number", true);
    buffer_write(__args_buffer, buffer_f64, _score);

    // param: _context, type: Float64
    if (!is_numeric(_context)) show_error($"{_GMFUNCTION_} :: _context expected number", true);
    buffer_write(__args_buffer, buffer_f64, _context);

    // param: _callback, type: Function
    if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
    var _callback_handle = __ext_core_function_register(_callback, __dispatcher);
    buffer_write(__args_buffer, buffer_u64, _callback_handle);

    var _return_value = __gamecenter_leaderboard_submit(buffer_get_address(__args_buffer), buffer_tell(__args_buffer));

    return _return_value;
}

/**
 * @param {String} _leaderboard_id
 * @param {Enum.GameCenterLeaderboardTimeScope} _time_scope
 * @param {Real} _range_start
 * @param {Real} _range_count
 * @param {Enum.GameCenterLeaderboardPlayerScope} _player_scope
 * @param {Function} _callback
 */
function gamecenter_leaderboard_load(_leaderboard_id, _time_scope, _range_start, _range_count, _player_scope, _callback)
{
    static __dispatcher = __GMGameCenter_get_dispatcher();

    var __args_buffer = __ext_core_get_args_buffer();

    // param: _leaderboard_id, type: String
    if (!is_string(_leaderboard_id)) show_error($"{_GMFUNCTION_} :: _leaderboard_id expected string", true);
    buffer_write(__args_buffer, buffer_u32, string_byte_length(_leaderboard_id));
    buffer_write(__args_buffer, buffer_string, _leaderboard_id);

    // param: _time_scope, type: enum GameCenterLeaderboardTimeScope

    if (!is_numeric(_time_scope)) show_error($"{_GMFUNCTION_} :: _time_scope expected number", true);
    buffer_write(__args_buffer, buffer_s32, _time_scope);

    // param: _range_start, type: Float64
    if (!is_numeric(_range_start)) show_error($"{_GMFUNCTION_} :: _range_start expected number", true);
    buffer_write(__args_buffer, buffer_f64, _range_start);

    // param: _range_count, type: Float64
    if (!is_numeric(_range_count)) show_error($"{_GMFUNCTION_} :: _range_count expected number", true);
    buffer_write(__args_buffer, buffer_f64, _range_count);

    // param: _player_scope, type: enum GameCenterLeaderboardPlayerScope

    if (!is_numeric(_player_scope)) show_error($"{_GMFUNCTION_} :: _player_scope expected number", true);
    buffer_write(__args_buffer, buffer_s32, _player_scope);

    // param: _callback, type: Function
    if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
    var _callback_handle = __ext_core_function_register(_callback, __dispatcher);
    buffer_write(__args_buffer, buffer_u64, _callback_handle);

    var _return_value = __gamecenter_leaderboard_load(buffer_get_address(__args_buffer), buffer_tell(__args_buffer));

    return _return_value;
}

/**
 * @param {String} _identifier
 * @param {Real} _percent_complete
 * @param {Bool} _show_completion_banner
 * @param {Function} _callback
 */
function gamecenter_achievement_report(_identifier, _percent_complete, _show_completion_banner, _callback)
{
    static __dispatcher = __GMGameCenter_get_dispatcher();

    var __args_buffer = __ext_core_get_args_buffer();

    // param: _identifier, type: String
    if (!is_string(_identifier)) show_error($"{_GMFUNCTION_} :: _identifier expected string", true);
    buffer_write(__args_buffer, buffer_u32, string_byte_length(_identifier));
    buffer_write(__args_buffer, buffer_string, _identifier);

    // param: _percent_complete, type: Float64
    if (!is_numeric(_percent_complete)) show_error($"{_GMFUNCTION_} :: _percent_complete expected number", true);
    buffer_write(__args_buffer, buffer_f64, _percent_complete);

    // param: _show_completion_banner, type: Bool
    if (!is_bool(_show_completion_banner)) show_error($"{_GMFUNCTION_} :: _show_completion_banner expected bool", true);
    buffer_write(__args_buffer, buffer_bool, _show_completion_banner);

    // param: _callback, type: Function
    if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
    var _callback_handle = __ext_core_function_register(_callback, __dispatcher);
    buffer_write(__args_buffer, buffer_u64, _callback_handle);

    var _return_value = __gamecenter_achievement_report(buffer_get_address(__args_buffer), buffer_tell(__args_buffer));

    return _return_value;
}

/**
 * @param {Function} _callback
 */
function gamecenter_achievement_reset_all(_callback)
{
    static __dispatcher = __GMGameCenter_get_dispatcher();

    var __args_buffer = __ext_core_get_args_buffer();

    // param: _callback, type: Function
    if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
    var _callback_handle = __ext_core_function_register(_callback, __dispatcher);
    buffer_write(__args_buffer, buffer_u64, _callback_handle);

    var _return_value = __gamecenter_achievement_reset_all(buffer_get_address(__args_buffer), buffer_tell(__args_buffer));

    return _return_value;
}

/**
 * @param {Function} _callback
 */
function gamecenter_achievement_load(_callback)
{
    static __dispatcher = __GMGameCenter_get_dispatcher();

    var __args_buffer = __ext_core_get_args_buffer();

    // param: _callback, type: Function
    if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
    var _callback_handle = __ext_core_function_register(_callback, __dispatcher);
    buffer_write(__args_buffer, buffer_u64, _callback_handle);

    var _return_value = __gamecenter_achievement_load(buffer_get_address(__args_buffer), buffer_tell(__args_buffer));

    return _return_value;
}

// Skipping function gamecenter_access_point_set_active (no wrapper is required)


// Skipping function gamecenter_access_point_get_active (no wrapper is required)


/**
 * @param {Enum.GameCenterAccessPointLocation} _location
 * @returns {Bool} 
 */
function gamecenter_access_point_set_location(_location)
{
    var __args_buffer = __ext_core_get_args_buffer();

    // param: _location, type: enum GameCenterAccessPointLocation

    if (!is_numeric(_location)) show_error($"{_GMFUNCTION_} :: _location expected number", true);
    buffer_write(__args_buffer, buffer_s32, _location);

    var _return_value = __gamecenter_access_point_set_location(buffer_get_address(__args_buffer), buffer_tell(__args_buffer));

    return _return_value;
}

// Skipping function gamecenter_access_point_get_location (no wrapper is required)


// Skipping function gamecenter_access_point_is_presenting_game_center (no wrapper is required)


// Skipping function gamecenter_access_point_is_visible (no wrapper is required)


// Skipping function gamecenter_access_point_set_show_highlights (no wrapper is required)


// Skipping function gamecenter_access_point_get_show_highlights (no wrapper is required)


/**
 * @param {Enum.GameCenterAccessPointCoordinate} _coordinate
 * @returns {Real} 
 */
function gamecenter_access_point_get_coordinate(_coordinate)
{
    var __args_buffer = __ext_core_get_args_buffer();

    // param: _coordinate, type: enum GameCenterAccessPointCoordinate

    if (!is_numeric(_coordinate)) show_error($"{_GMFUNCTION_} :: _coordinate expected number", true);
    buffer_write(__args_buffer, buffer_s32, _coordinate);

    var _return_value = __gamecenter_access_point_get_coordinate(buffer_get_address(__args_buffer), buffer_tell(__args_buffer));

    return _return_value;
}

/**
 * @param {Enum.GameCenterViewState} _state
 * @param {Function} _callback
 * @returns {Bool} 
 */
function gamecenter_access_point_present_with_state(_state, _callback)
{
    static __dispatcher = __GMGameCenter_get_dispatcher();

    var __args_buffer = __ext_core_get_args_buffer();

    // param: _state, type: enum GameCenterViewState

    if (!is_numeric(_state)) show_error($"{_GMFUNCTION_} :: _state expected number", true);
    buffer_write(__args_buffer, buffer_s32, _state);

    // param: _callback, type: Function
    if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
    var _callback_handle = __ext_core_function_register(_callback, __dispatcher);
    buffer_write(__args_buffer, buffer_u64, _callback_handle);

    var _return_value = __gamecenter_access_point_present_with_state(buffer_get_address(__args_buffer), buffer_tell(__args_buffer));

    return _return_value;
}

/**
 * @param {Function} _callback
 * @returns {Bool} 
 */
function gamecenter_access_point_present(_callback)
{
    static __dispatcher = __GMGameCenter_get_dispatcher();

    var __args_buffer = __ext_core_get_args_buffer();

    // param: _callback, type: Function
    if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
    var _callback_handle = __ext_core_function_register(_callback, __dispatcher);
    buffer_write(__args_buffer, buffer_u64, _callback_handle);

    var _return_value = __gamecenter_access_point_present(buffer_get_address(__args_buffer), buffer_tell(__args_buffer));

    return _return_value;
}

/// @ignore
function __GMGameCenter_get_decoders()
{
    static __decoders = [];
    return __decoders;
}
/// @ignore
function __GMGameCenter_get_dispatcher()
{
    static __dispatcher = new __GMNativeFunctionDispatcher(__GMGameCenter_invocation_handler, __GMGameCenter_get_decoders());
    return __dispatcher;
}

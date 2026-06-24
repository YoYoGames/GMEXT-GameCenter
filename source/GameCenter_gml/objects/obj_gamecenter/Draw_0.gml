/// @description Draw player information

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(fnt_gm_15);

var _player = gamecenter_local_player_get_info();
draw_text(x, 100, "Player: " + json_stringify(_player));

draw_text(
    x,
    280,
    "Authenticated: " + string(gamecenter_local_player_is_authenticated())
);

draw_text(
    x,
    310,
    "Underage: " + string(gamecenter_local_player_is_underage())
);

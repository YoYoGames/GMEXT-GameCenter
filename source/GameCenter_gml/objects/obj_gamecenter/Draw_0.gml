/// @description Draw player information

// Set font preferences before start drawing
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_font(fnt_gm_15)

// The 'gamecenter_local_player_get_info' will return a struct containing
// information related to the currently logged in Player (for details on the
// information refer to the manual's JSON Structures section). We stringify it
// so it can be drawn as text.
draw_text(x,100,"Player: " + string_replace_all(json_stringify(gamecenter_local_player_get_info()), "\",", "\",\n"))

// The 'gamecenter_local_player_is_authenticated' will return a boolean indicating
// if the user is currently authenticated on not (if not the other functionality will
// not work correctly). Before using GameCenter functionality you need to authenticate
// using the method 'gamecenter_local_player_authenticate()'.
draw_text(x,280,"Authenticate: " + string(gamecenter_local_player_is_authenticated()))

// The 'gamecenter_local_player_is_underage' will return a boolean indicating
// whether or not the user is underaged.
draw_text(x,310,"UnderAge: "  + string(gamecenter_local_player_is_underage()))

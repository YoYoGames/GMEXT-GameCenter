/// @description Draw player information

// Set font preferences before start drawing
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_font(Font_YoYo_15)

// The 'GameCenter_LocalPlayer_GetInfo' will return a json formatted string containing
// information related to the currently logged in Player (for details on the information
// refer to the manual's JSON Structures section).
draw_text(x,100,"Player: " + string_replace_all(GameCenter_LocalPlayer_GetInfo(), "\",", "\",\n"))

// The 'GameCenter_LocalPlayer_IsAuthenticated' will return a boolean indicating
// if the user is currently authenticated on not (if not the other functionality will
// not work correctly). Before using GameCenter functionality you need to authenticate
// using the method 'GameCenter_LocalPlayer_Authenticate()'.
draw_text(x,280,"Authenticate: " + string(GameCenter_LocalPlayer_IsAuthenticated()))

// The 'GameCenter_LocalPlayer_IsUnderage' will return a boolean indicating
// whether or not the user is underaged.
draw_text(x,310,"UnderAge: "  + string(GameCenter_LocalPlayer_IsUnderage()))

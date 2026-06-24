/// @description Authenticate
	
// This is the first function that needs to be called before any other
// functionality can be used. This function will authenticate the users
// with their GameCenter account and will log them in.
// The function call triggers an Async Social Event.
if (!GameCenter_LocalPlayer_Authenticate())
	show_message_async("The extension doesn't seem to be loaded.");

// Try to setup the Game Center access point.
GameCenter_AccessPoint_SetActive(true);
GameCenter_AccessPoint_SetLocation(GameCenter_AccessPoint_Location_BottomLeading);
GameCenter_AccessPoint_SetShowHighlights(true);


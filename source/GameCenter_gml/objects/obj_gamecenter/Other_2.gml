/// @description Authenticate

// On macOS we need to pass the GameMaker window handle to the extension
// before actually using any functionality, or else the extension won't show
// any GameCenter pop ups.
// Returns false if the window is undefined or the view controller is undefined
/*
if (os_type == os_macosx)
	if (!GameCenter_MacOS_SetWindowHandle(window_handle()))
		show_message_async("Unable to set the window handle! w=" + string(window_handle()));
*/
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


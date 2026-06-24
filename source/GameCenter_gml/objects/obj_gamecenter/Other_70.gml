/// @description Handle callbacks

show_debug_message("GC ASYNC = " + json_encode(async_load));
var error_str = "Success.";
if (ds_map_exists(async_load, "error_code") && ds_map_exists(async_load, "error_message"))
{
	// "Error: 111 - Some error had occurred because because try again......"
	error_str = "Error: " + string(async_load[? "error_code"]) + " - " + async_load[? "error_message"];
	show_message_async("Failed " + async_load[? "type"] + "\n" + error_str);
}

// We create a switch on the 'type' of the event being triggered
// The type of events used by the GameCenter API starts with "GameCenter_"
switch(async_load[?"type"])
{
	// @triggered by GameCenter_LocalPlayer_Authenticate()
	case "GameCenter_Authenticate":
	// @triggered by GameCenter_Leaderboard_Submit()
	case "GameCenter_Leaderboard_Submit":
	// @triggered by GameCenter_Achievement_Report()
	case "GameCenter_Achievement_Report":
	// @triggered by GameCenter_Achievement_ResetAll()
	case "GameCenter_Achievement_ResetAll":
		show_debug_message(async_load[? "type"] + " " + error_str);
		break;
	
	// @triggered by GameCenter_PresentView_Default()
	// @triggered by GameCenter_PresentView_Achievement()
	// @triggered by GameCenter_PresentView_Achievements()
	// @triggered by GameCenter_PresentView_Leaderboard()
	// @triggered by GameCenter_PresentView_Leaderboards()
	case "GameCenter_PresentView_DidFinish":
		
		// At this point we just dismissed a GameCenter's overlay view.
		// Here we just use a debug message saying that the view was dismissed.
		show_debug_message("View DidFinish")
		break;
}
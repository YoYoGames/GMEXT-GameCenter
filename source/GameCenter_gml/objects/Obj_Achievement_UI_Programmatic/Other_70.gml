
var s = "Game Center Achievement Data:\n";

if (async_load[? "type"] != "GameCenter_Achievement_Load")
	exit

asyncBusy = false;

if (!async_load[? "success"]) 
{
	s += "Error:\n";
	s += "Message: " + async_load[? "error_message"] + "\n";
	s += "Code: " + string(async_load[? "error_code"]) + "\n";
}
else 
{
	if(ds_map_exists(async_load,"YYAchievement1"))
	{
		 var struct = json_parse(async_load[?"YYAchievement1"])
		 s += struct.identifier + ": " + string(struct.percentComplete) + "%\n"
	}
	else
		s += "YYAchievement1: 0% \n";
		
	if(ds_map_exists(async_load,"YYAchievement2"))
	{
		 var struct = json_parse(async_load[?"YYAchievement2"])
		 s += struct.identifier + ": " + string(struct.percentComplete) + "%\n"
	}
	else
		s += "YYAchievement2: 0% \n";
}

s += "\nData End.\n";
show_message_async(s);


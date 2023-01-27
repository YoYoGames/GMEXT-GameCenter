
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
	if(ds_map_exists(async_load,"data")) {
		
		var data = json_parse(async_load[?"data"]);
		for (var i = 0; i < array_length(data); i++) {
			var struct = data[i];
			s += struct.identifier + ": " + string(struct.percentComplete) + "%\n"
		}
	}
}

s += "\nData End.\n";
show_message_async(s);


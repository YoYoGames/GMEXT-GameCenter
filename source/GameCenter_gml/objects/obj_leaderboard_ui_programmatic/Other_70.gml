
var s = "Game Center Leaderboard Data:\n";

if (async_load[? "type"] != "GameCenter_Leaderboard_Load")
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
	// string: Use this string to display the name of your leaderboard:
	s += "Leaderboard: " + async_load[? "leaderboard_id"] + "\n";
	var entries = async_load[? "entries"];
	s += "Entries: " + string(entries) + ", rank displayName formattedScore date context rawScore:\n";
	for (var i = 0; i < entries; ++i) 
	{
		var e_score = async_load[? "entry_score_" + string(i)];
		var e_fmt_score = async_load[? "entry_formatted_score_" + string(i)];
		var e_context = async_load[? "entry_context_" + string(i)];
		var e_rank = async_load[? "entry_rank_" + string(i)];
		var e_date = async_load[? "entry_date_" + string(i)];
		var e_info = json_parse(async_load[? "entry_info_" + string(i)]);
		s += 
			string(e_rank) + " " +
			string(e_info[$ "displayName"]) + " " +
			string(e_fmt_score) + " " +
			date_datetime_string(e_date) + " " +
			string(e_context) + " " + 
			string(e_score) + "\n";
	}
	
	var l_score = async_load[? "local_score"];
	var l_fmt_score = async_load[? "local_formatted_score"];
	var l_context = async_load[? "local_context"];
	var l_rank = async_load[? "local_rank"];
	var l_date = async_load[? "local_date"];
	var l_info = json_parse(async_load[? "local_info"]);
	var l_has_this_player = l_rank != -1;
	if (l_has_this_player) {
		s += "--- This player is present: same format\n";
		s += 
			// you can display this:
			string(l_rank) + " " +
			string(l_info[$ "displayName"]) + " " +
			string(l_fmt_score) + " " +
			date_datetime_string(l_date) + " " +
			// you usually should NEVER display this: but it's a demo so who cares
			string(l_context) + " " + 
			string(l_score) + "\n";	
	}
		
}

// display the data in a small async window:
s += "\nData End.\n";
show_message_async(s);


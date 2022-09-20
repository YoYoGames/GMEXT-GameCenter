/// @description debug

if (keyboard_check_released(ord("F")))
	show_message_async(program_directory + "\n" + working_directory);

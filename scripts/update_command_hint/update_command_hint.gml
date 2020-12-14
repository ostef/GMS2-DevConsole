/// @desc update_command_hint
/// @desc textbox_input
function update_command_hint(argument0) {
	var input = argument0;
	var splitted = string_split(input, " ");
	var command_name = ds_list_find_value(splitted, 0);

	// Get command info
	var entry = ds_map_find_value(o_dev_console.command_names, command_name);

	// Update command hint
	if (!is_undefined(entry))
	{
		o_dev_console.command_hint = command_name + " " + ds_list_find_value (entry, 2);
	}
	else
	{
		o_dev_console.command_hint = "";
	}




}

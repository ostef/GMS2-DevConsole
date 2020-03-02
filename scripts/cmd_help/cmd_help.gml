/// @desc cmd_help
/// @arg command_name

// If no argument is provided, print the list of commands
if (argument_count == 0)
{
	print_to_console("List of all commands:");

	// Iterate through all the registered commands and print their name
	for (var i = 0; i < ds_list_size(o_dev_console.command_names); i++)
	{
		var current = ds_list_find_value(o_dev_console.command_names, i);
		print_to_console("- " + current);
	}
}
else
{
	var command_name = string(argument[0]);
	var entry = ds_map_find_value(o_dev_console.command_names, command_name);
	
	if (!is_undefined(entry))
	{
		// Print the description of the command
		print_to_console(ds_list_find_value (entry, 1));
		// Print the command name followed by the arguments
		print_to_console("Usage: " + command_name + " " + ds_list_find_value (entry, 2));
	}
}

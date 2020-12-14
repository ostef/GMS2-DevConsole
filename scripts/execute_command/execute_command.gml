/// @desc execute_command
/// @arg command_name
/// @arg args
/// @arg arg_count
function execute_command(argument0, argument1, argument2) {
	var command_name = argument0;
	var args = argument1;
	var arg_count = argument2;
	var entry = ds_map_find_value(o_dev_console.command_map, command_name);

	// Execute the command if it has been found
	if (!is_undefined(entry))
	{
		var script = ds_list_find_value(entry, 0);
		script_execute_args(script, args, arg_count);
	}
	else
	{
		print_to_console("Unknown command (" + command_name + ")");
	}



}

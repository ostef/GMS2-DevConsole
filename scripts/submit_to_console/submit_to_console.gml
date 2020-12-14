/// @desc submit_to_console
/// @arg text
function submit_to_console(argument0) {
	var text = argument0;

	var parsed = parse_command(text);
	var command_name = ds_list_find_value(parsed, 0);
	var arg_count = ds_list_size(parsed)-1;
	var command_args = array_create(arg_count);

	// Populate the array of arguments
	for (var i = 0; i < arg_count; i++)
	{
		command_args[i] = ds_list_find_value(parsed, i+1);
	}

#region Handle references to global variables
	for (var i = 0; i < arg_count; i++)
	{
		var arg_as_str = string(command_args[i]);
	
		if (string_starts_with(arg_as_str, "$"))
		{
			// Delete the '$' at the beginning of the string
			arg_as_str = string_delete(arg_as_str, 1, 1);
		
			if (variable_global_exists(arg_as_str))
			{
				command_args[i] = variable_global_get(arg_as_str);
			}
		}
	}
#endregion

	print_to_console(">. " + text);
	execute_command(command_name, command_args, arg_count);

	// Destroy the list
	ds_list_destroy(parsed);



}

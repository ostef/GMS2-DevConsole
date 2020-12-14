/// @desc add_console_command
/// @arg command_name
/// @arg command_script
/// @arg command_description
/// @arg command_arguments
function add_console_command(argument0, argument1, argument2, argument3) {
	var command_name = argument0;
	var command_script = argument1;
	var command_description = argument2;
	var command_arguments = argument3;

	var command_entry = ds_list_create();
	ds_list_add(command_entry, command_script);
	ds_list_add(command_entry, command_description);
	ds_list_add(command_entry, command_arguments);

	ds_map_add_list(o_dev_console.command_map, command_name, command_entry);
	ds_list_add(o_dev_console.command_names, command_name);
	ds_list_sort(o_dev_console.command_names, true);

	// Add the command name to the list of possible suggestions
	ds_list_add(o_dev_console.input_textbox.input_suggestions, command_name);



}

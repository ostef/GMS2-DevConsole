/// @desc cmd_call
/// @arg script_name
/// @arg arg0, arg1 ...
function cmd_call() {
	var script_name = argument[0];
	var script = asset_get_index(script_name);
	var arg_count = argument_count - 1;
	var args = array_create(arg_count);

	// Populate the array of arguments
	for (var i = 0; i < arg_count; i++)
	{
		args[i] = argument[i + 1];
	}

	// Execute the script
	script_execute_args(script, args, arg_count);



}

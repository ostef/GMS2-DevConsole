/// @desc cmd_get_instances
/// @arg obj
function cmd_get_instances() {

	// Check if the object was provided
	if (argument_count < 1) 
	{
		print_argument_count_error(1, argument_count);

		exit;
	}

	var obj_name = string(argument[0]);
	var obj = asset_get_index(obj_name);

	// Check if the object exist
	if (!object_exists(obj))
	{
		print_to_console("ERROR: object '" + obj_name + "' does not exist");
	
		exit;
	}

	// Print the id of all instances of the provided object
	for (var i = 0; i < instance_number(obj); i++)
	{
		print_to_console("Instance " + string(i) + " of type " + obj_name + " is " + string(instance_find(obj, i)));
	}



}

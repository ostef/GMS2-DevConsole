/// @desc cmd_create
/// @arg obj
/// @arg pos_x
/// @arg pos_y
/// @arg (layer_name)
function cmd_create() {

	// We need at least the object, the x and y position
	if (argument_count < 3)
	{
		print_argument_count_error(3, argument_count);

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

	var pos_x = real(argument[1]);
	var pos_y = real(argument[2]);

	// If we provided an argument for the layer
	if (argument_count > 3)
	{
		// Get the layer
		var layer_name = string(argument[3])
		var opt_layer = layer_get_id(layer_name);
	
		// Check if the layer exists
		if (!layer_exists(opt_layer))
		{
			print_to_console("ERROR: layer '" + layer_name + "' does not exist");
		
			exit;
		}
	
		// Create the instance on the provided layer
		instance_create_layer(pos_x, pos_y, layer_name, obj);
		print_to_console("Created object '" + obj_name + "' at position (" + string(pos_x) + ", " + string(pos_y) + ") on layer '" + layer_name + "'");
	}
	else
	{
		// Create the instance at depth 0
		instance_create_depth(pos_x, pos_y, 0, obj);
		print_to_console("Created object '" + obj_name + "' at position (" + string(pos_x) + ", " + string(pos_y) + ") at depth 0");
	}



}

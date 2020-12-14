/// @desc cmd_set
/// @arg inst
/// @arg var_name
/// @arg value
function cmd_set() {

	// We need 3 arguments
	if (argument_count < 3) 
	{
		print_argument_count_error(3, argument_count);
	
		exit;
	}

	var inst_arg = argument[0];
	var var_name = string(argument[1]);
	var var_value = argument[2];

	// Handle global variables
	if (string(inst_arg) == "global")
	{
		// Check if the variable exists
		if (!variable_global_exists(var_name))
		{
			print_to_console("ERROR: Global variable '" + var_name + "' does not exist");
	
			exit;
		}
	
		// Set the variable
		variable_global_set(var_name, var_value);
		print_to_console("global " + var_name + " set to " + string(var_value));
	}
	else	// Handle instance variables
	{
		// Check if the instance id is valid
		if (!is_int64(inst_arg))
		{
			print_to_console("ERROR: Invalid instance id: " + string(inst_arg));
		
			exit;
		}
	
		var inst = int64(inst_arg);
	
		// Check if the variable exists
		if (!variable_instance_exists(inst, var_name))
		{
			print_to_console("ERROR: Instance variable '" + var_name + "' does not exist");
		
			exit;
		}
	
		// Set the variable
		variable_instance_set(inst, var_name, var_value);
		print_to_console(string(inst) + "." + var_name + " set to " + string(var_value));
	}



}

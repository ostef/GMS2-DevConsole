/// @desc cmd_get
/// @arg inst
/// @arg var_name

// We need 2 arguments
if (argument_count < 2) 
{
	print_argument_count_error(4, argument_count);
	
	exit;
}

var inst_arg = argument[0];
var var_name = string(argument[1]);

// Handle global variables
if (string(inst_arg) == "global")
{
	// Check if the variable exist
	if (!variable_global_exists(var_name))
	{
		print_to_console("ERROR: Global variable '" + var_name + "' does not exist");
	
		exit;
	}
	
	// Get the value and print it
	var var_value = variable_global_get(var_name);
	print_to_console("global " + var_name + " = " + string(var_value));
}
else	// Handle instance variables
{
	// Check if the variable exist
	if (!variable_instance_exists(inst_arg, var_name))
	{
		print_to_console("ERROR: Instance variable '" + var_name + "' does not exist");
		
		exit;
	}
	
	// Get the value and print it
	var var_value = variable_instance_get(inst_arg, var_name);
	print_to_console(string(inst_arg) + "." + var_name + " = " + string(var_value));
}

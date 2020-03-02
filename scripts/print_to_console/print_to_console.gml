/// @desc print_to_console
/// @arg string
var str = argument0;
var str_length = string_length(str);
var output_length = string_length(o_dev_console.output);

// Check if we reached the maximum output length
if (output_length + str_length > o_dev_console.output_max_length)
{
	clear_output();
}

// Update output
o_dev_console.output += str + "\n";

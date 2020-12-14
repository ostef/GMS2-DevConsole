/// @desc parse_command
/// @arg command_input
function parse_command(argument0) {
	var command_input = argument0;
	var input_length = string_length(command_input);
	var result_list = ds_list_create();

	var i = 0;
	var current_word = "";

	// Read the command name
	for (; i < input_length; i++)
	{
		var char = string_char_at(command_input, i + 1);
		// Break on space
		if (char == " ") { break; }
	
		current_word += char;
	}

	ds_list_add(result_list, current_word);

	var current_argument_is_string = false;
	current_word = "";

	// Read the arguments
	for (i++; i < input_length; i++)
	{
		var char = string_char_at(command_input, i + 1);
	
		// Read string arguments
		if (char == "\"")
		{
			if (current_argument_is_string)
			{
				current_argument_is_string = false;
			
				ds_list_add(result_list, current_word);
				current_word = "";
			
				continue;
			}
			else if (current_word == "")
			{
				current_argument_is_string = true;
			
				continue;
			}
		}
		else if (char == " " && !current_argument_is_string)
		{
			ds_list_add(result_list, current_word);
			current_word = "";
		
			continue;
		}
	
		current_word += char;
	}

	if (current_word != "")
	{
		ds_list_add(result_list, current_word);
	}

	return result_list;



}

/// @desc input_textbox_suggest
/// @arg text
var text = argument0;

// Iterate through all the registered suggestions and compare with the input
for (var i = 0; i < ds_list_size(input_suggestions); i++)
{
	var current = ds_list_find_value(input_suggestions, i);
	
	// current is a suggestion only if it starts the same as the input
	if (string_starts_with(current, text))
	{
		return current;
	}
}

// Iterate through the input history and compare with the input
for (var i = 0; i < ds_list_size(input_history); i++)
{
	var current = ds_list_find_value(input_history, i);
	
	// current is a suggestion only if it starts the same as the input
	if (string_starts_with(current, text))
	{
		return current;
	}
}

return "";

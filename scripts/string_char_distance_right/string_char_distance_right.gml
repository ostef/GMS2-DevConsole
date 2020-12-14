/// @desc string_char_distance_right
/// @arg str
/// @arg char
/// @arg position
function string_char_distance_right(argument0, argument1, argument2) {
	var str = argument0;
	var char = argument1;
	var position = argument2

	var count = 0;

	for (var i = position + 1; i <= string_length(str); i++)
	{
		count++;
				
		if (string_char_at(str, i + 1) == char)
		{
			break;
		}
	}

	return count;



}

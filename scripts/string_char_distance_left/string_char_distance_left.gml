/// @desc string_char_distance_left
/// @arg str
/// @arg char
/// @arg position
var str = argument0;
var char = argument1;
var position = argument2

var count = 0;

for (var i = position - 1; i >= 0; i--)
{
	count++;
				
	if (string_char_at(str, i + 1) == char)
	{
		break;
	}
}

return count;

/// @desc string_wrap_width
/// @arg str
/// @arg width
/// @arg break
/// @arg split

// https://www.gmlscripts.com/script/string_wordwrap_width
// GMLscripts.com/license

var text_current = argument0;
var width = argument1;
var break_char = argument2;
var split = argument3;

var pos_space = -1;
var pos_current = 1;
var text_output = "";

if (is_real(break_char))
{
	break_char = "#";
}

text_output = "";

while (pos_current < string_length(text_current))
{
	if (string_width(string_copy(text_current, 1, pos_current)) > width)
	{
		// If there is a space in this line then we can break there
		if (pos_space != -1)
		{
			text_output += string_copy(text_current, 1, pos_space) + string(break_char);
			// Remove the text we just looked at from the current text string
			text_current = string_copy(text_current, pos_space + 1, string_length(text_current) - (pos_space));
			pos_current = 1;
			pos_space = -1;
		}
		else if (split)
		{
			// If not, we can force line breaks
			text_output += string_copy(text_current, 1, pos_current - 1) + string(break_char);
			// Remove the text we just looked at from the current text string
			text_current = string_copy(text_current, pos_current, string_length(text_current) - (pos_current - 1));
			pos_current = 1;
			pos_space = -1;
		}
	}
	
	if (string_char_at(text_current, pos_current) == " ")
	{
		pos_space = pos_current;
	}
	
	pos_current += 1;
}

if (string_length(text_current) > 0)
{
	text_output += text_current;
}

return text_output;

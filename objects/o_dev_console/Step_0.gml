/// @desc Animate
if (!is_opened)
{
	current_console_height = lerp(current_console_height, 0, .1);
}
else
{
	current_console_height = lerp(current_console_height, console_height, .1);
}

// Handle moving through the outputs


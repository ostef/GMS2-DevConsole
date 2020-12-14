/// @desc set_input_textbox_focus
/// @arg textbox
/// @arg focused
function set_input_textbox_focus(argument0, argument1) {
	var textbox = argument0;
	var focused = argument1;

	// Set all other input textboxes to unfocused
	with (o_input_textbox)
	{
		is_focused = false;
	}

	textbox.is_focused = focused;
	keyboard_string = "";



}

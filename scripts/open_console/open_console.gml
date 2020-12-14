/// @desc open_console
/// @arg open
function open_console(argument0) {
	var open = argument0;

	o_dev_console.is_opened = open;
	set_input_textbox_focus (o_dev_console.input_textbox, open);



}

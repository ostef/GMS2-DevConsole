/// @desc input_textbox_delete_selected
/// @arg delete_left
var delete_left = argument0;
var delete_pos = delete_left ? cursor_position : cursor_position + 1;
var count = 1;

if (selection_size != 0)
{
	count = abs(selection_size);
	delete_pos = selection_size > 0 ? cursor_position + 1 : cursor_position - count + 1;
}
else if (keyboard_check(vk_control))
{
	count = delete_left ? string_char_distance_left(input_text, " ", cursor_position) : string_char_distance_right(input_text, " ", cursor_position);
	
	if (delete_left)
	{
		delete_pos -= count - 1;
	}
}

var new_input = string_delete(input_text, delete_pos, count);
input_textbox_set_input(new_input);
input_textbox_handle_key();
	
if (delete_pos <= cursor_position)
{
	input_textbox_move_cursor(-count);
}
	
input_textbox_reset_selection();

/// @desc Handle keyboard input
if (!is_focused) { exit; }

#region User input
if (keyboard_lastkey == vk_backspace || keyboard_lastkey == vk_delete)	// Deletion
{
	input_textbox_delete_selected(keyboard_lastkey == vk_backspace);
}
else if (keyboard_lastkey == vk_right || keyboard_lastkey == vk_left)	// Cursor movement
{
	var dir = (keyboard_lastkey == vk_right) - (keyboard_lastkey == vk_left);
	
	if (keyboard_check(vk_control))
	{
		if (keyboard_check(vk_shift))
		{
			var selection_increment = dir == 1 ? string_char_distance_right(input_text, " ", cursor_position + selection_size) : -string_char_distance_left(input_text, " ", cursor_position + selection_size);
			input_textbox_set_selection_size(selection_size + selection_increment);
		}
		else
		{
			var cursor_movement = dir == 1 ? string_char_distance_right(input_text, " ", cursor_position) : -string_char_distance_left(input_text, " ", cursor_position);
			input_textbox_move_cursor(cursor_movement);
		}
	}
	else
	{
		if (keyboard_check(vk_shift))
		{
			input_textbox_set_selection_size(selection_size + dir);
		}
		else
		{
			var cursor_movement = sign(selection_size) == dir ? selection_size : dir;
			input_textbox_move_cursor(cursor_movement);
		}
	}
		
	input_textbox_handle_key();
}
else if (keyboard_string != "")		// Typing
{
	if (!keyboard_check(vk_backspace))
	{
		// Delete the current selection first
		if (selection_size != 0)
		{
			input_textbox_delete_selected(false);
		}
		
		var input_length = string_length(keyboard_string);
		var new_input = string_insert(keyboard_string, input_text, cursor_position + 1);
		input_textbox_set_input(new_input);
		input_textbox_move_cursor(input_length);
	}
	
	keyboard_string = "";
}
#endregion

#region User submit
if (keyboard_check_pressed(vk_enter) && input_text != "")
{
	if (on_user_submit != noone) 
	{
		script_execute(on_user_submit, input_text);
	}
		
	ds_list_insert(input_history, 0, input_text);
	input_textbox_set_input("");
	input_textbox_set_cursor_position(0);
}
#endregion

#region Accept suggestion
if (keyboard_check_pressed(vk_tab) && input_suggestion != "")
{
	input_textbox_set_input(input_suggestion);
	input_textbox_set_cursor_position(string_length(input_text));
}
#endregion

#region Copy
if (keyboard_check(vk_control) && keyboard_check_pressed(ord("C")) && selection_size != 0)
{
	var copy_pos = selection_size > 0 ? cursor_position : cursor_position + selection_size;
	var copy_length = abs(selection_size);
	var copied_text = string_copy(input_text, copy_pos + 1, copy_length);
	clipboard_set_text(copied_text);
}
#endregion

#region Pasting
if (keyboard_check(vk_control) && keyboard_check_pressed(ord("V")) && clipboard_has_text())
{
	// Delete the current selection first
	if (selection_size != 0)
	{
		input_textbox_delete_selected(false);
	}
	
	var paste_length = string_length(clipboard_get_text());
	var new_input = string_insert(clipboard_get_text(), input_text, cursor_position + 1);
	input_textbox_set_input(new_input);
	input_textbox_move_cursor(paste_length);
}
#endregion

#region Handle input history
var input_history_movement = keyboard_check_pressed(vk_up) - keyboard_check_pressed(vk_down);
	
if (input_history_movement != 0)
{
	input_history_position = clamp (input_history_position + input_history_movement, 1, ds_list_size(input_history));
		
	if (input_history_position != 0)
	{
		input_text = ds_list_find_value(input_history, input_history_position - 1);
		input_textbox_set_cursor_position(string_length(input_text));
		input_suggestion = input_textbox_suggest(input_text);
			
		if (on_user_input != noone) 
		{
			script_execute(on_user_input, input_text);
		}
	}
}
#endregion

#region Select all
var input_length = string_length(input_text);

if (keyboard_check(vk_control) && keyboard_check_pressed(ord("A")))
{
	input_textbox_set_cursor_position(input_length);
	input_textbox_set_selection_size(-input_length);
}
#endregion

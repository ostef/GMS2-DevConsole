/// @desc input_textbox_move_cursor
/// @arg amount
var amount = argument0;

cursor_position = clamp(cursor_position + amount, 0, string_length(input_text));
selection_size = 0;

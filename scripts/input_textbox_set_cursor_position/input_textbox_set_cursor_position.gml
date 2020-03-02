/// @desc input_textbox_set_cursor_position
/// @arg position
var position = argument0;

cursor_position = clamp(position, 0, string_length(input_text));
selection_size = 0;

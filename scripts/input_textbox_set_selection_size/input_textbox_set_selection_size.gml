/// @desc input_textbox_set_selection_size
/// @arg size
var size = argument0;

selection_size = clamp(size, -cursor_position, string_length(input_text) - cursor_position);

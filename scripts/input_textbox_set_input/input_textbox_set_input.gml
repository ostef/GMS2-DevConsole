/// @desc input_textbox_set_input
/// @arg new_input
var new_input = argument0;

input_text = new_input;
input_history_position = 0;
input_suggestion = input_textbox_suggest(input_text);
display_carret = true;
alarm[0] = carret_blink_rate;

if (on_user_input != noone) 
{
	script_execute(on_user_input, input_text);
}

/// @desc Initialize variables
is_focused = false;

input_history = ds_list_create();
input_history_position = 0;

input_suggestions = ds_list_create();
input_suggestion = "";

input_text = "";
cursor_position = 0;
selection_size = 0;

on_user_submit = noone;
on_user_input = noone;

display_carret = false;
carret_blink_rate = 50;
alarm[0] = carret_blink_rate;

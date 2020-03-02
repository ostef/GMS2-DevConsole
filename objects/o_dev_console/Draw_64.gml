/// @desc Draw the console
var console_width = display_get_gui_width();

var char_width = string_width(" ");
var char_height = string_height(" ");

// Draw command hint under everything
if (command_hint != "")
{
	draw_nine_slice(s_console_bg, 0, current_console_height, console_width, current_console_height + char_height + 4);
	draw_set_color(c_gray);
	draw_text(5, current_console_height + 2, " " + command_hint);
	draw_set_color(c_white);
}

draw_nine_slice(s_console_bg, 0, current_console_height - console_height, console_width, current_console_height);

draw_set_valign(fa_bottom);
draw_set_color(c_gray);

var output_display = string_wrap_width(output, console_width - 20, "\n.");

draw_text(5, current_console_height - 5, output_display + " " + input_textbox.input_suggestion);
draw_set_color(c_white);
draw_text(5, current_console_height - 5, ">" + input_textbox.input_text);

draw_set_valign(fa_top);

var carret_x = 5 + input_textbox.cursor_position * char_width + char_width;
var carret_y = current_console_height - 5 - char_height;

draw_set_alpha(.5);

// Draw input textbox selection
if (input_textbox.selection_size != 0)
{
	draw_rectangle_color(carret_x, carret_y, carret_x + input_textbox.selection_size * char_width, carret_y + char_height, c_gray, c_gray, c_gray, c_gray, false);
}

// Draw input textbox carret
if (input_textbox.display_carret)
{
	draw_rectangle_color(carret_x, carret_y, carret_x + 1, carret_y + char_height, c_white, c_white, c_white, c_white, false);
}

draw_set_alpha(1);

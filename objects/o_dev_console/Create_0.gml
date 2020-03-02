/// @desc Initialize variables
command_map = ds_map_create();	// key is the name of the command, value is the script to execute
command_names = ds_list_create();
is_opened = false;
console_height = 280;
current_console_height = 0;
output = "";
output_max_length = 1024;
command_hint = "";

input_textbox = instance_create_layer(0, 0, "inst_main", o_input_textbox);
input_textbox.persistent = true;
input_textbox.on_user_submit = submit_to_console;
input_textbox.on_user_input = update_command_hint;

// Add console commands
add_console_command("help", cmd_help, "Get help on the available commands", "command_name");
add_console_command("clear", cmd_clear, "Clear the console output", "");
add_console_command("quit_game", cmd_quit_game, "Quit the game", "");
add_console_command("print", cmd_print, "Print something to the console", "str");
add_console_command("create", cmd_create, "Create an object at the specified location", "obj pos_x pos_y (layer_name)");
add_console_command("get", cmd_get, "Get the value of a variable. Use global as the first argument for a global variable", "inst_id var_name");
add_console_command("set", cmd_set, "Set the valua of a variable. Use global as the first argument for a global variable", "inst_id var_name var_value");
add_console_command("get_instances", cmd_get_instances, "Get all instances of the specified object", "obj");
add_console_command("call", cmd_call, "Call a script with arguments", "script_name arg0, arg1 ...");

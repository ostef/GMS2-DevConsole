/// @desc Cleanup
ds_list_destroy(command_names);

var current = ds_map_find_first(command_map);

while (!is_undefined(current))
{
	var entry = ds_map_find_value(command_map, current);
	ds_list_destroy(entry);
	current = ds_map_find_next(command_map, current);
}

ds_map_destroy(command_map);

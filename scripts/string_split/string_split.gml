/// @desc string_split
/// @arg string
/// @arg delim
var str = argument0;
var delim = argument1;
var list = ds_list_create();
var count = string_count(delim, str);

if (count == 0)
{
	ds_list_add(list, str);
}
else
{
	for (var i = 0; i < count; i++)
	{
		var pos = string_pos(delim, str);
		ds_list_add(list, string_copy(str, 1, pos-1));
		str = string_delete(str, 1, pos);
	}
	
	ds_list_add(list, str);
}

return list;

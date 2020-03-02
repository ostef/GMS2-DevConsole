/// @desc Get pointed instance id
for (var i = 0; i < instance_count; i++)
{
	// Get the instance
	var inst = instance_find(all, i);
	
	if (point_in_rectangle(mouse_x, mouse_y, inst.bbox_left, inst.bbox_top, inst.bbox_right, inst.bbox_bottom))
	{
		print_to_console("Instance: " + string(inst));
	}
}

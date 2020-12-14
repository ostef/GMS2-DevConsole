/// @desc string_starts_with
/// @arg str
/// @arg substr
function string_starts_with(argument0, argument1) {
	var str = argument0;
	var substr = argument1;

	return string_pos(substr, str) == 1;



}

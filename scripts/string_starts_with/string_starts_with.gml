/// @desc string_starts_with
/// @arg str
/// @arg substr
var str = argument0;
var substr = argument1;

return string_pos(substr, str) == 1;

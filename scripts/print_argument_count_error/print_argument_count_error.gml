/// @desc print_argument_count_error
/// @arg expected
/// @arg got
function print_argument_count_error(argument0, argument1) {
	var expected = argument0;
	var got = argument1;

	print_to_console("ERROR: Wrong number of arguments (expected " + string(expected) + ", got " + string(got) + ")");



}

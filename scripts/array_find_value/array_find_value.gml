function array_find_value(array, value) {
	for (var i = 0; i < array_length(array); i++) {
		if (array[i] == value) return i;
	}
	return -1;
}
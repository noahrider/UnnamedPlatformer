function scr_formatstring(defaultString, arguments, offset, index = 1, argumentReplaceString = "{:n}") {
	var argcount = array_length(arguments);
	var currentArgument = index;
	var length = ((argcount - offset) + 1);
	while (currentArgument < length) {
		var myarg = string_replace(argumentReplaceString, "n", string(currentArgument));
		var idx = ((currentArgument + offset) - 1);
		defaultString = string_replace(defaultString, myarg, arguments[idx]);
		currentArgument++;
	}
	return defaultString;
}
function scr_parse_leveldata(data) {
	printf("loading data: {:1}", data);
	if (!string_starts_with(data, "UPL!")) {
		printf(">>ERROR!! loading an invalid level");
		return false;
	}
	try {
		var objects, fullvars, tempvars, variables, varKeys, objectKey, objx, objy;
		data = string_delete(data, 0, 4);
		objects = string_split(data, ";", true);
		for (var i = 0; i < array_length(objects); i++) {
			fullvars[i] = string_split(objects[i], ",", true);
			for (var v = 0; v < array_length(fullvars[i]); v++) {
				tempvars[i][v] = string_split(fullvars[i][v], ":", true);
				varKeys[i][v] = tempvars[i][v][0];
				variables[i][v] = tempvars[i][v][1];
				if (varKeys[i][v] == "objectKey") objectKey[i] = real(variables[i][v]);
				if (varKeys[i][v] == "x") objx[i] = real(variables[i][v]);
				if (varKeys[i][v] == "y") objy[i] = real(variables[i][v]);
				if (varKeys[i][v] == "sprite_index") variablesj[i][v] = asset_get_index(variables[i][v]);
			}
			
		}
		
		for (var obj = 0; obj < array_length(objects); obj++) {
			var objectIndex = scr_get_object_index(objectKey[obj]);
			//try and guess the index based on existing variables
			printf(array_contains(varKeys[obj], "objectKey"));
			if (objectIndex == noone) {
				if (array_contains(varKeys[obj], "tileID")) objectIndex = obj_tileobject;
				if (array_contains(varKeys[obj], "ogx")) objectIndex = obj_sawblade;
			}
			var instance = instance_create_depth(objx[obj], objy[obj], 0, objectIndex);
			for (var i = 0; i < array_length(variables[obj]); i++) {
				if (string_starts_with(variables[obj][i], "_STRING_")) {
					variables[obj][i] = string_delete(variables[obj][i], 0, strlen("_STRING_"));
					variable_instance_set(instance, varKeys[obj][i], variables[obj][i]);
				} else variable_instance_set(instance, varKeys[obj][i], real(variables[obj][i]));
			}
			
		}
		return true;
	} catch (_ex) {
		printf("Failed to load level.");
		printf(_ex.message);
		printf(_ex.longMessage);
		return false;
	}
}
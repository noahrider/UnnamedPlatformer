var _id = ds_map_find_value(async_load, "id");
if (async_load[? "id"] == saveDialogID) {
	if (async_load[? "status"]) {
		if (async_load[? "result"] != "") {
			projectName = async_load[? "result"];
			scr_editor_savelevel(projectName);
		} else {
			show_message_async("You need to provide a file!");
		}
	}
}
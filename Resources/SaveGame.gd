class_name SaveGame
extends Resource

const SAVE_GAME_BASE_PATH := "user://games"

export var version := 1

export var games := []


func write_savegame() -> void:
	ResourceSaver.save(get_save_path(), self)


static func save_exists() -> bool:
	return ResourceLoader.exists(get_save_path())


static func load_savegame() -> Resource:
	var save_path := get_save_path()
	return ResourceLoader.load(save_path, "", true)



static func make_random_path() -> String:
	return "user://temp_file_" + str(randi()) + ".tres"


# This function allows us to save and load a tsext resource in debug builds and a
# binary resource in the released product.
static func get_save_path() -> String:
	var extension := ".res"
	return SAVE_GAME_BASE_PATH + extension

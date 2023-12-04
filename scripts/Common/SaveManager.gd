class_name SaveManager

static func save_game(player_data):
	var file = FileAccess.open("user://player.sav", FileAccess.WRITE)
	file.store_var(player_data)
	file.close()

static func load_game():
	if !FileAccess.file_exists("user://player.sav"):
		return null

	var file = FileAccess.open("user://player.sav", FileAccess.READ)
	var playerData = file.get_var()
	file.close()

	return playerData

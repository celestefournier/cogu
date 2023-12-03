func Save(player_data):
	var file = FileAccess.open("user://player.sav", FileAccess.WRITE)
	file.store_var(player_data)
	file.close()

func Load():
	var file = FileAccess.open("user://player.sav", FileAccess.READ)
	var content = file.get_var()
	return content

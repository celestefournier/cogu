extends Control

var selected_fungus = 0

func _ready():
	update_fungus_sprite()

func _on_ui_le_pressed():
	selected_fungus -= 1
	
	if selected_fungus < 0:
		selected_fungus = Global.FUNGUS_SPRITES.size() - 1
	
	update_fungus_sprite()

func _on_ui_ld_pressed():
	selected_fungus += 1
	
	if selected_fungus >= Global.FUNGUS_SPRITES.size():
		selected_fungus = 0
	
	update_fungus_sprite()

func update_fungus_sprite():
	$PlayerSelect.texture = Global.FUNGUS_SPRITES[selected_fungus]

func _on_confirme_pressed():
	Global.player_fungus = selected_fungus
	open_game_scene()

func open_game_scene():
	get_tree().change_scene_to_file("res://scenes/Game.tscn")

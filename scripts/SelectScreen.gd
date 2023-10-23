extends Control

var selected_fungus = 0
var fungus_list

func _on_indoor_button_up():
	fungus_list = Global.INDOOR_FUNGUS
	open_fungus_selection_screen()

func _on_outdoor_button_up():
	fungus_list = Global.OUTDOOR_FUNGUS
	open_fungus_selection_screen()

func open_fungus_selection_screen():
	$AreaSelection.visible = false
	$FungosSelecion.visible = true
	update_fungus_sprite()

func _on_ui_le_pressed():
	selected_fungus -= 1
	
	if selected_fungus < 0:
		selected_fungus = fungus_list.size() - 1
	
	update_fungus_sprite()

func _on_ui_ld_pressed():
	selected_fungus += 1
	
	if selected_fungus >= fungus_list.size():
		selected_fungus = 0
	
	update_fungus_sprite()

func update_fungus_sprite():
	var texture = load(fungus_list[selected_fungus])
	$FungosSelecion/FungusImage.texture = texture

func _on_confirme_pressed():
	Global.player_fungus = selected_fungus
	open_game_scene()

func open_game_scene():
	get_tree().change_scene_to_file("res://scenes/Game.tscn")

extends Control

var fungi_data = preload("res://resources/Fungi.tres")
var available_fungi: Array[Fungus]
var selected_fungus_index: int

func _on_indoor_button_up():
	available_fungi = fungi_data.fungus_list.filter(func(item):
		return item.habitat == Fungus.Habitat.INTERNAL
	)
	open_fungus_selection_screen()

func _on_outdoor_button_up():
	available_fungi = fungi_data.fungus_list.filter(func(item):
		return item.habitat == Fungus.Habitat.EXTERNAL
	)
	open_fungus_selection_screen()

func open_fungus_selection_screen():
	$AreaSelection.visible = false
	$FungosSelecion.visible = true
	selected_fungus_index = 0
	update_fungus_sprite()

func _on_ui_le_pressed():
	selected_fungus_index -= 1
	
	if selected_fungus_index < 0:
		selected_fungus_index = available_fungi.size() - 1
	
	update_fungus_sprite()

func _on_ui_ld_pressed():
	selected_fungus_index += 1
	
	if selected_fungus_index >= available_fungi.size():
		selected_fungus_index = 0
	
	update_fungus_sprite()

func update_fungus_sprite():
	$FungosSelecion/FungusImage.texture = available_fungi[selected_fungus_index].image

func _on_confirme_pressed():
	var gameplay_scene_data = GameplaySceneData.new(available_fungi[selected_fungus_index])
	gameplay_scene_data.name = "GameplaySceneData"
	get_tree().root.add_child.call_deferred(gameplay_scene_data)

	open_game_scene()

func open_game_scene():
	get_tree().change_scene_to_file("res://scenes/Gameplay.tscn")

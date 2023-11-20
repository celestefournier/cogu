extends Control

func game_over():
	get_tree().change_scene_to_file("res://scenes/GameOver.tscn")

func open_action_buttons():
	$ActionButtons.visible = true
	$FoodModal.visible = false


func open_food_modal():
	$ActionButtons.visible = false
	$FoodModal.visible = true


func _on_supply_button_up():
	open_food_modal()

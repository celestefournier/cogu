extends Control

func _ready():
	open_action_buttons()

func game_over():
	get_tree().change_scene_to_file("res://scenes/GameOver.tscn")

func open_action_buttons():
	$ActionButtons.visible = true
	$FoodModal.visible = false
	$HealthModal.visible = false

func open_food_modal():
	$ActionButtons.visible = false
	$FoodModal.visible = true
	$HealthModal.visible = false

func open_health_modal():
	$ActionButtons.visible = false
	$FoodModal.visible = false
	$HealthModal.visible = true


func _on_nutrition_button_up():
	open_food_modal()


func _on_health_button_up():
	open_health_modal()

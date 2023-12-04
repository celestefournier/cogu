extends Control

@onready var fungus_controller = $Fungus

func _ready():
	open_action_buttons()

func _notification(what):
	if what != MainLoop.NOTIFICATION_APPLICATION_FOCUS_OUT:
		return
	
	var fungus = fungus_controller.fungus
	var save_datetime = Time.get_unix_time_from_system()
	
	var player_data = PlayerData.new(
		fungus.nutrition_status,
		fungus.temperature,
		fungus.humidity_status,
		fungus.last_temperature_change,
		fungus.last_hydration,
		save_datetime
	)
	
	SaveManager.save_game(player_data)

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

extends Control

@onready var fungus = $'../Fungus'
@onready var game_controller = $'../../Game'

func hydrate():
	fungus.hydrate()
	game_controller.open_action_buttons()
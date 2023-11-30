extends Control

@onready var fungus = $'../Fungus'
@onready var game_controller = $'../../Game'
@onready var temperature_value = $'TemperatureValue'
@onready var slider = $'Slider'

func _ready():
	temperature_value.text = str(fungus.intial_temperature) + '°C'

func hydrate():
	fungus.hydrate()
	game_controller.open_action_buttons()

func on_temperature_change(value):
	temperature_value.text = str(value) + '°C'
	fungus.change_temperature(value)

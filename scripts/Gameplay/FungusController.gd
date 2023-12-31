extends Node

@onready var food_balloon = $'../FoodBalloon'
@onready var temperature_balloon = $'../TemperatureBalloon'
@onready var humidity_balloon = $'../HumidityBalloon'
@onready var food_value_debug = $'../Debbuger/Food Value'
@onready var humidity_value_debug = $'../Debbuger/Humidy Value'
@onready var humidity_value = $'../HealthModal/HumidityValue'
@onready var game_controller = $'../../Game'

var fungus
var balloon_visible = false
var intial_temperature = 20

func _ready():
	var gameplay_scene_data = get_tree().root.get_node("GameplaySceneData")
	gameplay_scene_data.queue_free()
	fungus = gameplay_scene_data.fungus
	fungus.setup(100, 100, intial_temperature, Time.get_unix_time_from_system(), Time.get_unix_time_from_system())

	self.texture = fungus.image

	_loop_action()


func _loop_action():
	while true:
		food_value_debug.text = str(fungus.nutrition_status)
		humidity_value_debug.text = str(fungus.humidity_status)
		humidity_value.text = str(fungus.humidity_status) + '%'

		await get_tree().create_timer(1).timeout

		fungus.update_status()

		if (fungus.nutrition_status <= 50 && !balloon_visible):
			food_balloon.visible = true
			balloon_visible = true

		if ((fungus.temperature < fungus.temperature_preference_min ||
			fungus.temperature > fungus.temperature_preference_max) &&
			!balloon_visible):
			temperature_balloon.visible = true
			balloon_visible = true

		if (fungus.humidity_status <= 50 && !balloon_visible):
			humidity_balloon.visible = true
			balloon_visible = true
		
		if (!fungus.is_alive()):
			game_controller.game_over()


func feed(nutrient):
	fungus.feed(nutrient)
	food_value_debug.text = str(fungus.nutrition_status)

	if (fungus.nutrition_status >= 50):
		food_balloon.visible = false
		balloon_visible = false

func change_temperature(temperature):
	fungus.change_temperature(temperature)

	if (temperature >= fungus.temperature_preference_min &&
		temperature <= fungus.temperature_preference_max):
		temperature_balloon.visible = false
		balloon_visible = false

func hydrate():
	fungus.hydrate()
	humidity_value_debug.text = str(fungus.humidity_status)

	if (fungus.humidity_status >= 50):
		humidity_balloon.visible = false
		balloon_visible = false

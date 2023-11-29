extends TextureRect

@onready var food_balloon = $'../FoodBalloon'
@onready var humidity_balloon = $'../HumidityBalloon'
@onready var food_value = $'../Debbuger/Food Value'
@onready var temperature_value = $'../Debbuger/Temp Value'
@onready var humidity_value = $'../Debbuger/Humidy Value'
@onready var game_controller = $'../../Game'

var fungus_texture = load(Global.player_fungus)
var fungus
var balloon_visible = false

func _ready():
	self.texture = fungus_texture

	var nutrient_preference = Nutrient.new(Nutrient.Type.PROTEIN, Nutrient.Origin.ANIMAL)
	var temperature_preference_min = 20
	var temperature_preference_max = 30
	var humidity_preference_min = 70
	var humidity_preference_max = 80
	var last_hydration = Time.get_unix_time_from_system()

	fungus = Fungus.new(
		nutrient_preference,
		temperature_preference_min,
		temperature_preference_max,
		humidity_preference_min,
		humidity_preference_max,
		last_hydration
	)

	_loop_action()


func _loop_action():
	while true:
		food_value.text = str(fungus.nutrition_status)
		temperature_value.text = str(fungus.temperature_status)
		humidity_value.text = str(fungus.humidity_status)

		await get_tree().create_timer(1).timeout

		fungus.update_status()

		if (fungus.nutrition_status <= 50 && !balloon_visible):
			food_balloon.visible = true
			balloon_visible = true

		# if (fungus.temperature_status <= 50):
		# 	food_balloon.visible = true

		if (fungus.humidity_status <= 50 && !balloon_visible):
			humidity_balloon.visible = true
			balloon_visible = true

		if (!fungus.is_alive()):
			game_controller.game_over()


func feed(nutrient):
	fungus.feed(nutrient)
	food_value.text = str(fungus.nutrition_status)

	if (fungus.nutrition_status >= 50):
		food_balloon.visible = false
		balloon_visible = false

func hydrate():
	fungus.hydrate()
	humidity_value.text = str(fungus.humidity_status)

	if (fungus.humidity_status >= 50):
		humidity_balloon.visible = false
		balloon_visible = false

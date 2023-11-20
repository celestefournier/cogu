extends TextureRect

@onready var food_balloon = $'../FoodBalloon'
@onready var food_value = $'../Food Value'
@onready var game_controller = $'../../Game'

var fungus_texture = load(Global.player_fungus)
var fungus

func _ready():
	self.texture = fungus_texture

	var nutrient = Nutrient.new(Nutrient.Type.PROTEIN, Nutrient.Origin.ANIMAL)
	fungus = Fungus.new(nutrient, 20, 10, 80)

	_loop_action()


func _loop_action():
	while true:
		food_value.text = str(fungus.nutrition_level)

		await get_tree().create_timer(1).timeout

		fungus.update_status()

		if (fungus.nutrition_level <= 50):
			food_balloon.visible = true

		# if (fungus.temperature_level <= 50):
		# 	food_balloon.visible = true

		# if (fungus.humidity_level <= 50):
		# 	food_balloon.visible = true

		if (fungus.nutrition_level <= 0 || fungus.temperature_level <= 0 || fungus.humidity_level <= 0):
			game_controller.game_over()


func feed(nutrient):
	fungus.feed(nutrient)
	food_value.text = str(fungus.nutrition_level)

	if (fungus.nutrition_level >= 50):
		food_balloon.visible = false

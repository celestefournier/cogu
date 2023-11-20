extends Control

const NUTRIENT_TYPES = [
	Nutrient.Type.PROTEIN,
	Nutrient.Type.LIPID,
	Nutrient.Type.CARBOHYDRATE
]

@onready var fungus = $'../Fungus'
@onready var game_controller = $'../../Game'
@onready var nutrient_label = $Nutrient
var selected_type = 0

func _ready():
	_update_text()

func _on_previous_nutrient_button_up():
	_change_nutrient_type(-1)

func _on_next_nutrient_button_up():
	_change_nutrient_type(1)

func _change_nutrient_type(direction):
	selected_type = (selected_type + direction + NUTRIENT_TYPES.size()) % NUTRIENT_TYPES.size()
	_update_text()

func _on_vegetal_button_up():
	feed(Nutrient.Origin.VEGETAL)

func _on_animal_button_up():
	feed(Nutrient.Origin.ANIMAL)

func feed(nutrient_origin):
	var nutrient_type = NUTRIENT_TYPES[selected_type]
	var nutrient = Nutrient.new(nutrient_type, nutrient_origin)
	
	fungus.feed(nutrient)
	game_controller.open_action_buttons()

func _update_text():
	var text = ""

	match NUTRIENT_TYPES[selected_type]:
		Nutrient.Type.PROTEIN:
			text = "Proteína"
		Nutrient.Type.LIPID:
			text = "Lipídio"
		Nutrient.Type.CARBOHYDRATE:
			text = "Carboidrato"
	
	nutrient_label.text = text

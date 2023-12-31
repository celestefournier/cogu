extends Resource
class_name Fungus

const NUTRIENT_PREFERENCE_BONUS = 30
const NUTRIENT_NOT_PREFERENCE_BONUS = 10

enum Habitat { INTERNAL, EXTERNAL }

@export var id: int
@export var image: CompressedTexture2D
@export var habitat: Habitat
@export var nutrient_preference: Nutrient
@export var temperature_preference_min: int
@export var temperature_preference_max: int
@export var humidity_preference_min: int
@export var humidity_preference_max: int

var nutrition_status: int
var humidity_status: int
var temperature: int
var last_hydration: float
var last_temperature_change: float

func setup(_nutrition_status, _humidity_status, _temperature, _last_hydration, _last_temperature_change):
	nutrition_status = _nutrition_status
	humidity_status = _humidity_status
	temperature = _temperature
	last_hydration = _last_hydration
	last_temperature_change = _last_temperature_change

func feed(nutrient):
	if nutrition_status >= 100:
		return false
	
	if nutrient_preference.equals(nutrient):
		nutrition_status = min(nutrition_status + NUTRIENT_PREFERENCE_BONUS, 100)
	else:
		nutrition_status = min(nutrition_status + NUTRIENT_NOT_PREFERENCE_BONUS, 100)
	
	return true

func hydrate():
	if humidity_status >= 100:
		return false
	
	last_hydration = Time.get_unix_time_from_system()
	humidity_status = min(nutrition_status + 50, 100)

	return true

func change_temperature(value):
	temperature = value
	last_temperature_change = Time.get_unix_time_from_system()


func update_status():
	nutrition_status -= 2
	humidity_status = max(humidity_status - 2, 0)

func is_alive():
	var current_time = Time.get_unix_time_from_system()
	var max_hours_without_hydration = 24
	var max_hours_outside_temperature_preference = 24

	var is_malnourished = nutrition_status <= 0
	var is_thermal_stress = ((temperature < temperature_preference_min ||
							 temperature > temperature_preference_max) &&
							(current_time - last_temperature_change) / 3600 >= max_hours_outside_temperature_preference)
	var is_dehydrated = (current_time - last_hydration) / 3600 >= max_hours_without_hydration

	return !is_malnourished && !is_thermal_stress && !is_dehydrated

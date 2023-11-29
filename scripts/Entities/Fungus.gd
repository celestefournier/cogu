extends Node

class_name Fungus

const NUTRIENT_PREFERENCE_BONUS = 30
const NUTRIENT_NOT_PREFERENCE_BONUS = 10

var nutrient_preference: Nutrient
var temperature_preference_min: int
var temperature_preference_max: int
var humidity_preference_min: int
var humidity_preference_max: int

var nutrition_status:int = 100
var temperature_status:int = 100
var humidity_status:int = 100

var last_hydration

func _init(
	_nutrient_preference,
	_temperature_preference_min,
	_temperature_preference_max,
	_humidity_preference_min,
	_humidity_preference_max,
	_last_hydration
):
	nutrient_preference = _nutrient_preference
	temperature_preference_min = _temperature_preference_min
	temperature_preference_max = _temperature_preference_max
	humidity_preference_min = _humidity_preference_min
	humidity_preference_max = _humidity_preference_max
	last_hydration = _last_hydration

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

func update_status():
	nutrition_status -= 5
	temperature_status = max(temperature_status - 5, 0)
	humidity_status = max(temperature_status - 5, 0)

func is_alive():
	var current_time = Time.get_unix_time_from_system()
	var max_hours_without_hydration = 24

	var is_malnourished = nutrition_status <= 0
	var is_dehydrated = (current_time - last_hydration) / 3600 >= max_hours_without_hydration

	return !is_malnourished && !is_dehydrated

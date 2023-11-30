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
var humidity_status:int = 100

var temperature
var last_temperature_change
var last_hydration

func _init(
	_nutrient_preference,
	_temperature_preference_min,
	_temperature_preference_max,
	_humidity_preference_min,
	_humidity_preference_max,
	_last_hydration,
	_temperature
):
	nutrient_preference = _nutrient_preference
	temperature_preference_min = _temperature_preference_min
	temperature_preference_max = _temperature_preference_max
	humidity_preference_min = _humidity_preference_min
	humidity_preference_max = _humidity_preference_max
	last_hydration = _last_hydration
	temperature = _temperature

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
	nutrition_status -= 5
	humidity_status = max(humidity_status - 5, 0)

func is_alive():
	var current_time = Time.get_unix_time_from_system()
	var max_hours_without_hydration = 24
	var max_hours_outside_temperature_preference = 24

	var is_malnourished = nutrition_status <= 0
	var is_thermal_stress = ((temperature < temperature_preference_min ||
							 temperature > temperature_preference_max) &&
							 last_temperature_change != null &&
							(current_time - last_temperature_change) / 3600 >= max_hours_outside_temperature_preference)
	var is_dehydrated = (current_time - last_hydration) / 3600 >= max_hours_without_hydration

	return !is_malnourished && !is_thermal_stress && !is_dehydrated

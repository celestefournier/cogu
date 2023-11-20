extends Node

class_name Fungus

const NUTRIENT_PREFERENCE_BONUS = 30
const NUTRIENT_NOT_PREFERENCE_BONUS = 10

var nutrient_preference: Nutrient
var temperature_preference: int
var temperature_preference_range: int
var humidity_preference: int

var nutrition_level:int = 100
var temperature_level:int = 100
var humidity_level:int = 100

func _init(_nutrient_preference, _temperature_preference, _temperature_preference_range, _humidity_preference):
    nutrient_preference = _nutrient_preference
    temperature_preference = _temperature_preference
    temperature_preference_range = _temperature_preference_range
    humidity_preference = _humidity_preference

func feed(nutrient):
    if nutrition_level >= 100:
        return false
    
    if nutrient_preference.equals(nutrient):
        nutrition_level = min(nutrition_level + NUTRIENT_PREFERENCE_BONUS, 100)
    else:
        nutrition_level = min(nutrition_level + NUTRIENT_NOT_PREFERENCE_BONUS, 100)
    
    return true

func update_status():
    nutrition_level -= 5
    temperature_level -= 5
    humidity_level -= 5
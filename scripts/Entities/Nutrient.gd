class_name Nutrient

enum Type { PROTEIN, LIPID, CARBOHYDRATE }
enum Origin { ANIMAL, VEGETAL }

var type: Type
var origin: Origin

func _init(_type, _origin):
	type = _type
	origin = _origin

func equals(nutrient):
	return type == nutrient.type and origin == nutrient.origin

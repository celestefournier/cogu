extends Resource
class_name Nutrient

enum Type { PROTEIN, LIPID, CARBOHYDRATE }
enum Origin { ANIMAL, VEGETAL }

@export var type: Type
@export var origin: Origin

func _init(_type = Type.PROTEIN, _origin = Origin.ANIMAL):
	type = _type
	origin = _origin

func equals(nutrient):
	return type == nutrient.type and origin == nutrient.origin

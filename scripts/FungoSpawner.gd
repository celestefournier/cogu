extends Node2D

@onready var fungoPosition = $Marker2D
var player_fungo: Node2D = null

func _ready():
	player_fungo = load("res://scenes/Fungo1.tscn").instantiate()
	player_fungo.global_position = fungoPosition.global_position
	add_child(player_fungo)

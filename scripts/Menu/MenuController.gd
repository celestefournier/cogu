extends Node

func _ready():
	var singleton = preload("res://scripts/SelectScreen/Busanfa.gd").new()
	singleton.name = "MeuSingleton" # Nomear o nó para facilitar o acesso por seu nome
	get_tree().root.add_child.call_deferred(singleton)

func new_game():
	get_tree().change_scene_to_file("res://scenes/SelectScreen.tscn")

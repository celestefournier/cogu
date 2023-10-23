extends Node

const INDOOR_FUNGUS = [
	"res://sprites/1.png",
	"res://sprites/2.png",
	"res://sprites/3.png",
]

const OUTDOOR_FUNGUS = [
	"res://sprites/4.png",
	"res://sprites/5.png",
	"res://sprites/6.png"
]

var player_fungus = 0
var player : Node2D

func instance_node(node, location, parent):
	var node_instance = node.instantiate()
	parent.add_child(node_instance)
	node_instance.global_position = location
	return node_instance

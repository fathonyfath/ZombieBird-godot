extends Node2D

export var bird_path: NodePath
onready var bird: Bird = get_node(bird_path) as Bird

func _unhandled_input(event):
	if event.is_action_pressed("flap") or (event is InputEventScreenTouch and event.is_pressed()):
		bird.jump()

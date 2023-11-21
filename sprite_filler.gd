extends Sprite

enum FillDirection { Up, Down }

export(FillDirection) var fill_direction = FillDirection.Up
export var extra: float = 10.0

var stored_bottom: float

onready var camera = $"%camera" as ExtendedCamera2D

func _ready():
	stored_bottom = self.position.y + self.scale.y
	
	get_viewport().connect("size_changed", self, "on_viewport_size_changed")
	update_size()

func on_viewport_size_changed():
	update_size()
	
func update_size():
	var camera_rect = camera.get_camera_rect()
	if fill_direction == FillDirection.Up:
		var size_needed = stored_bottom - camera_rect.position.y
		position.y = camera_rect.position.y - extra
		scale.y = size_needed + extra
	elif fill_direction == FillDirection.Down:
		var size_needed = camera_rect.size.y - (position.y - camera_rect.position.y)
		scale.y = size_needed + extra

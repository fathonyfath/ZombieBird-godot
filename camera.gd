extends Camera2D
class_name ExtendedCamera2D

var camera_size: Vector2
var camera_rect: Rect2

func _ready():
	calculate_camera_sizes()
	get_viewport().connect("size_changed", self, "on_viewport_size_changed")
	
func on_viewport_size_changed():
	calculate_camera_sizes()
	
func get_camera_rect() -> Rect2:
	if camera_rect == Rect2(0, 0, 0, 0):
		calculate_camera_sizes()
	return camera_rect

func calculate_camera_sizes():
	camera_size = get_viewport_rect().size * self.zoom
	camera_rect = Rect2(self.get_camera_screen_center() - camera_size / 2, camera_size)

tool
extends Sprite
class_name ScrollableSprite

signal scrolled_left

var is_scrolled_left: bool = false

func _process(delta):
	if position.x + texture.get_width() < 0:
		if is_scrolled_left == false:
			is_scrolled_left = true
			emit_signal("scrolled_left")
		
func get_tail_x() -> float:
	return position.x + texture.get_width()
	
func reset(new_x: float):
	position.x = new_x
	is_scrolled_left = false

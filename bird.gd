extends Area2D
class_name Bird

export var velocity: Vector2
export var acceleration: Vector2 = Vector2(0, 460)
export var jump_velocity: float = -140

onready var bird_sprite = $"%bird_sprite" as AnimatedSprite

func _ready():
	connect("area_entered", self, "on_bird_area_entered")
	
func _process(delta):
	if shouldnt_flap():
		if bird_sprite.animation != "static":
			bird_sprite.play("static")
	else:
		if bird_sprite.animation != "flapping":
			bird_sprite.play("flapping")

func _physics_process(delta):
	velocity = velocity + (acceleration * delta)
	if velocity.y > 200:
		velocity.y = 200
	
	translate(velocity * delta)
	
	if velocity.y < 0:
		rotation_degrees -= 600 * delta
		
		if rotation_degrees < -20:
			rotation_degrees = -20
	
	if is_falling():
		rotation_degrees += 480 * delta
		if (rotation_degrees > 90):
			rotation_degrees = 90

func is_falling() -> bool:
	return velocity.y > 110

func shouldnt_flap() -> bool:
	return velocity.y > 110

func jump():
	velocity.y = jump_velocity

func on_bird_area_entered(area: Area2D):
	pass

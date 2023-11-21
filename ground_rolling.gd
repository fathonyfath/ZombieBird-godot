extends Area2D

export var enabled: bool = true
export var speed: float = 10.0

onready var ground = $"%ground" as ScrollableSprite
onready var ground2 = $"%ground_2" as ScrollableSprite

func _ready():
	ground.connect("scrolled_left", self, "on_ground_scrolled_left")
	ground2.connect("scrolled_left", self, "on_ground2_scrolled_left")


func _process(delta):
	if (enabled):
		var translate_speed = Vector2.LEFT * speed * delta
		ground.translate(translate_speed)
		ground2.translate(translate_speed)

func on_ground_scrolled_left():
	ground.reset(ground2.get_tail_x())

func on_ground2_scrolled_left():
	ground2.reset(ground.get_tail_x())

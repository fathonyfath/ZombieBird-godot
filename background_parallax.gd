extends Node2D

export var enabled: bool = true
export var speed: float = 10.0

onready var background = $"%background" as ScrollableSprite
onready var background2 = $"%background_2" as ScrollableSprite
onready var background3 = $"%background_3" as ScrollableSprite

func _ready():
	background.connect("scrolled_left", self, "on_background_scrolled_left")
	background2.connect("scrolled_left", self, "on_background2_scrolled_left")
	background3.connect("scrolled_left", self, "on_background3_scrolled_left")


func _process(delta):
	if (enabled):
		var translate_speed = Vector2.LEFT * speed * delta
		background.translate(translate_speed)
		background2.translate(translate_speed)
		background3.translate(translate_speed)

func on_background_scrolled_left():
	background.reset(background3.get_tail_x())

func on_background2_scrolled_left():
	background2.reset(background.get_tail_x())

func on_background3_scrolled_left():
	background3.reset(background2.get_tail_x())


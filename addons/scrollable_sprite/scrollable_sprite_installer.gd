tool
extends EditorPlugin

func _enter_tree():
	var texture = ImageTexture.new()
	var image = Image.new()
	image.load("icon.png")
	image.resize(16, 16)
	texture.create_from_image(image)
	add_custom_type("ScrollableSprite", "Sprite", preload("scrollable_sprite.gd"), texture)

func _exit_tree():
	remove_custom_type("ScrollableSprite")

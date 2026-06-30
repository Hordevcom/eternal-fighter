extends Node2D
class_name DialogComponent

@onready var sprite_buble: Sprite2D = %SpriteBuble
@onready var text_label: RichTextLabel = %RichTextLabel

func show_text(text: String):
	text_label.text = text
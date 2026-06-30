extends Node
class_name AnimationComponent

var anim_sprite: AnimatedSprite2D

func set_anim_sprite(sprite: AnimatedSprite2D):
	anim_sprite = sprite


func play_anim(anim_name: String):
	anim_sprite.play(anim_name)

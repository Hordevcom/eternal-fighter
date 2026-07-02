extends UnitBase
class_name Ork

func _on_death():
	death = true
	anim_comp.play_anim("death")
	movement_comp.move_to_target(GameState.get_death_zone())
	collision.disabled = true


func _ready() -> void:
	super._ready()
	movement_comp.move_to_target(GameState.player_character)
extends Soldier
class_name Ork

func _on_death():
	death = true
	anim_comp.play_anim("death")
	movement_comp.move_to_target(GameState.get_death_zone())
	collision.disabled = true
extends UnitBase
class_name Soldier

func _ready() -> void:
	GameState.save_player(self)
	super._ready()
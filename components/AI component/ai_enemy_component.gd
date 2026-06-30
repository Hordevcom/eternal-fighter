extends AIBase
class_name AIEnemy

var player: Soldier
var is_attack: bool

func _ready() -> void:
	is_attack = false
	player = GameState.player_character
	print(player, " ", movement)

func _process(_delta: float) -> void:
	if !is_attack:
		if player and movement:
			print("ATTACK!")
			is_attack = true
			movement.move_to_target(player)

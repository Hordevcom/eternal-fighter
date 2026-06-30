extends Node

var player_character: Soldier

func save_player(player: Soldier):
	print(player.name, ": ", player.get_groups())
	if player.is_in_group("player") and !player.is_in_group("enemy"):
		player_character = player

func update_unit_stats():
	pass
	
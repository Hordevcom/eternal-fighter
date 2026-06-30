extends Node

var player_character: Soldier
var death_zone: Node2D

func save_player(player: Soldier):
	print(player.name, ": ", player.get_groups())
	if player.is_in_group("player") and !player.is_in_group("enemy"):
		player_character = player

func update_unit_stats():
	pass


func set_death_zone(zone: Node2D):
	death_zone = zone

func get_death_zone() -> Node2D:
	return death_zone

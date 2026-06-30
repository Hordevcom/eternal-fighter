extends Node
class_name StatsComponent

signal dead

var is_dead: bool = false

# Base stats that can be edited in the editor
@export var base_stats: StatPacket

var current_stats: StatPacket = StatPacket.new()

func _ready():
	current_stats.add_packet(base_stats)

func recalculate_stats():
	current_stats.reset()
	current_stats.add_packet(base_stats)
	current_stats.add_packet(GameState.player_character.equip_comp.calculate_equip_stats())


func take_damage(damage: float, damage_dealer: Soldier):
	current_stats.health -= damage
	print("take damage from ", damage_dealer.name, ", current health: ", current_stats.health)

	if current_stats.health <= 0:
		is_dead = true
		dead.emit()
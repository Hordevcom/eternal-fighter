extends Resource
class_name StatPacket

@export var health: float = 0.0
@export_range(0, 100, 1) var armor: float = 0.0
@export var fire_resist: float = 0.0

# Метод, который умеет «впитывать» в себя значения из другого пакета
func add_packet(other: StatPacket) -> void:
	if not other: return
	health += other.health
	armor += other.armor
	fire_resist += other.fire_resist

# Метод для полного сброса (очистки) статов перед пересчетом
func reset() -> void:
	health = 0.0
	armor = 0.0
	fire_resist = 0.0

func _to_string() -> String:
	return "StatPacket(health=%s, armor=%s, fire_resist=%s)" % [
		health,
		armor,
		fire_resist
	]
extends Item
class_name EquipItem

@export var stats: StatPacket
@export var equip_type: Enums.EquipType

func _init() -> void:
	item_type = ItemType.EQUIPMENT

func get_equip_stats():
	return stats

func _to_string() -> String:
	return str(equip_type)
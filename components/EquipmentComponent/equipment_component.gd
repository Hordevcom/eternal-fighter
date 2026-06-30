extends Node
class_name EquipmentComponent

var helmet: EquipItem
var chest: EquipItem
var boots: EquipItem
var gloves: EquipItem
var left_hand: EquipItem
var right_hand: EquipItem

var equipment_dict := {}

signal equip_updated

func _ready():
	_init_equipment_dict()

func _init_equipment_dict():
	equipment_dict = {
		Enums.EquipType.HELMET: helmet,
		Enums.EquipType.CHEST: chest,
		Enums.EquipType.BOOTS: boots,
		Enums.EquipType.GLOVES: gloves,
		Enums.EquipType.LEFTHAND: left_hand,
		Enums.EquipType.RIGHTHAND: right_hand
	}

func calculate_equip_stats() -> StatPacket:
	var total_stats: StatPacket = StatPacket.new()

	for item: EquipItem in equipment_dict.values():
		if item:
			total_stats.add_packet(item.get_equip_stats())

	return total_stats


func set_new_equip(new_item: EquipItem, prev_item: EquipItem):
	if new_item:
		equipment_dict[new_item.equip_type] = new_item
	elif new_item == null:
		if prev_item:
			equipment_dict[prev_item.equip_type] = null
	
	# owner.recalculate_stats()
	equip_updated.emit()
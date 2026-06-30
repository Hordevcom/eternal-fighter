extends InventorySlot
class_name EquipmentSlot

enum EquipType {
	HELMET,
	CHEST,
	BOOTS,
	GLOVES,
	LEFTHAND,
	RIGHTHAND
}

var equip_comp: EquipmentComponent
var stat_comp: StatsComponent

func _ready() -> void:
	equip_comp = GameState.player_character.get_equip_component()
	stat_comp = GameState.player_character.get_stats_component()

@export var item_type: EquipType

# 2. ПРОВЕРКА: Можно ли сюда сбросить?
func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
	# Принимаем данные, только если это словарь, пришедший из другого слота
	return data is Dictionary and data.has("origin_slot") and data["origin_slot"] != self and data.item.item_type == Item.ItemType.EQUIPMENT


func _drop_data(_at_position: Vector2, data: Variant) -> void:
	print("equip drop data!")
	var source_slot = data["origin_slot"] as InventorySlot
	var temp_item = item # Запоминаем, что лежало у нас (может быть null)

	# Меняем местами через ранее созданный метод
	set_item(source_slot.item)
	if source_slot is EquipmentSlot:
		source_slot.set_item_no_equip(temp_item)
	else:
		source_slot.set_item(temp_item)

	
func set_item(ext_item: Item) -> void:
	equip_comp.set_new_equip(ext_item, item)
	item = ext_item
	if item != null and texture_rect != null:
		texture_rect.texture = item.texture2D
		texture_rect.show()
	elif texture_rect != null:
		texture_rect.texture = null
		texture_rect.hide()

func set_item_no_equip(ext_item: Item) -> void:
	item = ext_item
	if item != null and texture_rect != null:
		texture_rect.texture = item.texture2D
		texture_rect.show()
	elif texture_rect != null:
		texture_rect.texture = null
		texture_rect.hide()
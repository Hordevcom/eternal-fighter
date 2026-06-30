extends Panel
class_name InventorySlot

var slot_index: int
var item: Item

@onready var texture_rect: TextureRect = $TextureRect


func set_item(ext_item: Item) -> void:
	item = ext_item
	if item != null and texture_rect != null:
		texture_rect.texture = item.texture2D
		texture_rect.show()
	elif texture_rect != null:
		texture_rect.texture = null
		texture_rect.hide()


# 1. НАЧАЛО ТАСКАНИЯ: Создаем превью и собираем данные
func _get_drag_data(_pos: Vector2) -> Variant:
	if item == null:
		return null
		
	# Формируем пакет данных
	var drag_data = {
		"origin_slot": self,
		"item": item
	}
	
	# Создаем красивого "призрака" под мышкой
	var preview = TextureRect.new()
	preview.texture = texture_rect.texture
	preview.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	preview.custom_minimum_size = size # Используем размер текущего слота
	preview.modulate.a = 0.6
	
	set_drag_preview(preview)
	return drag_data


# 2. ПРОВЕРКА: Можно ли сюда сбросить?
func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
	# Принимаем данные, только если это словарь, пришедший из другого слота
	return data is Dictionary and data.has("origin_slot") and data["origin_slot"] != self


# 3. ФИНАЛ: Меняем итемы местами
func _drop_data(_at_position: Vector2, data: Variant) -> void:
	var source_slot = data["origin_slot"] as InventorySlot
	var temp_item = item # Запоминаем, что лежало у нас (может быть null)
	
	# Меняем местами через ранее созданный метод
	set_item(source_slot.item)
	source_slot.set_item(temp_item)

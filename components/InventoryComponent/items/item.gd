extends Resource
class_name Item


@export var texture2D: Texture2D
@export var name: String
@export var description: String
@export var max_count: int = 1
@export var current_count: int = 1
@export var item_type: ItemType

enum ItemType {
	EQUIPMENT,
	CONSUMABLE,
	RESOURCE,
	SKILL
}

func _to_string() -> String:
	return name
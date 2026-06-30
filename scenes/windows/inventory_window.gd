extends Window

@export var inventory_size: int = 20
@export var slot_scene: PackedScene

@onready var grid: GridContainer = %GridContainer

var player_inventory: InventoryComponent

func _ready() -> void:
	create_slots()
	player_inventory = get_player_inventory()
	update_inventory_display()

func _on_close_requested() -> void:
	self.hide()

func create_slots():
	for i in inventory_size:
		var slot = slot_scene.instantiate()
		grid.add_child(slot)

func get_player_inventory() -> InventoryComponent:
	return GameState.player_character.get_inventory()

func update_inventory_display():
	var items = player_inventory.items
	var slots = grid.get_children()

	# Clear existing item displays
	for slot in slots:
		if slot.has_method("clear_item"):
			slot.clear_item()

	# Fill slots with items
	for i in range(min(items.size(), slots.size())):
		var item = items[i]
		var slot = slots[i]
		if slot.has_method("set_item"):
			slot.set_item(item)


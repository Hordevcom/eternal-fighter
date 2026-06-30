extends Node2D

@export var tile1: Node2D
@export var tile2: Node2D

@onready var death_zone: Node2D = %DeathZone

var deadzone: Vector2 = Vector2(183, 319)
var tile_move_speed: float = 100
var tile_add_position: float = 880

var inventory_scene = preload("res://scenes/windows/InventoryWindow.tscn")
var inventory_window: Window = null

func _ready() -> void:
	GameState.set_death_zone(death_zone)

func _process(delta):
	# Move tiles from right to left
	tile1.position.x -= tile_move_speed * delta
	tile2.position.x -= tile_move_speed * delta

	# Check if tile1 position is less than or equal to deadzone
	if tile1.position.x <= deadzone.x:
		tile1.position.x += tile_add_position

	# Check if tile2 position is less than or equal to deadzone
	if tile2.position.x <= deadzone.x:
		tile2.position.x += tile_add_position


func _on_button_pressed() -> void:
	if inventory_window == null:
		inventory_window = inventory_scene.instantiate()

		get_tree().root.add_child(inventory_window)

		inventory_window.show()
	elif inventory_window:
		inventory_window.show()

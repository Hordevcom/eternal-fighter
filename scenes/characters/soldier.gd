extends CharacterBody2D
class_name Soldier

@onready var inventory: InventoryComponent = %InventoryComponent
@onready var stats_comp: StatsComponent = %StatsComponent
@onready var equip_comp: EquipmentComponent = %EquipmentComponent
@onready var ai_comp: AIBase = %AIComponent
@onready var movement_comp: MovementComponent = %MovementComponent
@onready var anim_comp: AnimationComponent = %AnimationComponent
@onready var combat_comp: CombatComponent = %CombatComponent
@onready var dialog_comp: DialogComponent = %DialogComponent

@onready var anim_sprite: AnimatedSprite2D = %AnimatedSprite
@onready var collision: CollisionShape2D = %CollisionShape2D

@export var attack_frame: int

var death: bool = false

func _ready() -> void:
	GameState.save_player(self)
	anim_comp.set_anim_sprite(anim_sprite)

	equip_comp.equip_updated.connect(_on_equip_updated)
	combat_comp.ready_to_attack.connect(_on_ready_to_attack)
	combat_comp.lost_target.connect(_on_lost_target)
	anim_sprite.frame_changed.connect(_on_frame_changed)
	stats_comp.dead.connect(_on_death)

	ai_comp.set_movement_comp(movement_comp)
	


func get_inventory() -> InventoryComponent:
	return inventory

func get_stats_component() -> StatsComponent:
	return stats_comp

func get_equip_component() -> EquipmentComponent:
	return equip_comp

func get_movement_component() -> MovementComponent:
	return movement_comp

func recalculate_stats() -> void:
	stats_comp.recalculate_stats()

func _on_equip_updated():
	recalculate_stats()

func _physics_process(_delta: float) -> void:
	if !movement_comp.reach_target and movement_comp.target:
		movement_comp.move()

func _on_ready_to_attack():
	anim_comp.play_anim("attack")

func _on_frame_changed():
	if anim_sprite.animation == "attack" and anim_sprite.frame == attack_frame:
		combat_comp.make_damage_to_target()


func take_damage(damage_amount: float, damage_maker: Soldier):
	if !stats_comp.is_dead:
		stats_comp.take_damage(damage_amount, damage_maker)


func _on_death():
	anim_comp.play_anim("death")

func _on_lost_target():
	if !death:
		anim_comp.play_anim("walk")
extends Area2D
class_name CombatComponent

@export var damage: float = 50.0

var target: UnitBase

signal ready_to_attack
signal lost_target


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D and body != owner:
		target = body
		ready_to_attack.emit()


func _on_body_exited(body: Node2D) -> void:
	if body == target:
		target = null
		lost_target.emit()


func make_damage_to_target():
	if target and target.stats_comp.is_dead:
		target = null
		lost_target.emit()
	elif target:
		target.take_damage(damage, owner)

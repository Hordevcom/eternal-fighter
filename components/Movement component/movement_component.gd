extends Node
class_name MovementComponent

@export var speed: float = 400
# Порог в пикселях, при приближении на который цель считается достигнутой
@export var arrival_tolerance: float = 5.0 

var target: Node2D
var reach_target: bool = false

func move_to_target(new_target: Node2D) -> void:
	if new_target == null:
		print("new target is NULL!")
		return
	
	target = new_target
	reach_target = false
	print("target: ", target.name)


func move() -> void:
	# Если цели нет или она уже достигнута, ничего не делаем
	if reach_target or target == null:
		print("target not found or reach target true!")
		return

	var body := owner as CharacterBody2D
	if not body:
		print("ITS NOT BODY!")
		return # На всякий случай проверяем, что owner — это CharacterBody2D

	# 1. Проверяем расстояние до цели
	var distance := body.global_position.distance_to(target.global_position)

	if distance <= arrival_tolerance:
		reach_target = true
		target = null
		body.move_and_slide()
		return

	# 2. Если не достигли, продолжаем движение
	var direction := body.global_position.direction_to(target.global_position)
	body.velocity = direction * speed
	body.move_and_slide()
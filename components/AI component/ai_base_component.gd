extends Node
class_name AIBase

var movement: MovementComponent
	

func set_movement_comp(move_comp: MovementComponent):
	movement = move_comp
	print(movement)

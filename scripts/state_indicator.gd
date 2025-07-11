extends Control

@onready var previous_state := get_node("Panel/PreviousState")
@onready var current_state := get_node("Panel/CurrentState")
@onready var future_state := get_node("Panel/FutureState")

func _process(delta: float) -> void:
	if get_parent().state == 0:
		previous_state.texture = preload("res://Gas Assets/Gas_Idle1.png")
		current_state.texture = preload("res://Solid Assets/Solid_Idle1.png")
		future_state.texture = preload("res://Liquid Assets/Liquid_Idle1.png")
	if get_parent().state == 1:
		previous_state.texture = preload("res://Solid Assets/Solid_Idle1.png")
		current_state.texture = preload("res://Liquid Assets/Liquid_Idle1.png")
		future_state.texture = preload("res://Gas Assets/Gas_Idle1.png")
	if get_parent().state == 2:
		previous_state.texture = preload("res://Liquid Assets/Liquid_Idle1.png")
		current_state.texture = preload("res://Gas Assets/Gas_Idle1.png")
		future_state.texture = preload("res://Solid Assets/Solid_Idle1.png")

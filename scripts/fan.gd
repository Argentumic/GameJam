extends Node2D

var fan_speed = -200
var is_moved = false

func _on_blow_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		is_moved = true


func _on_blow_area_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		is_moved = false

func _physics_process(delta: float) -> void:
	if get_node("../Player").state == 0:
		fan_speed = -75
	elif get_node("../Player").state == 1:
		fan_speed = -500
	else:
		fan_speed = -299
		
	if is_moved:
		get_node("../Player").position.x += fan_speed*delta

extends Node2D

var fan_speed: Vector2
var is_moved: bool = false
@export var is_up: bool = false
@export var is_down: bool = false
@export var is_left: bool = true
@export var is_right: bool = false

func _on_blow_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		is_moved = true


func _on_blow_area_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		is_moved = false

func _physics_process(delta: float) -> void:
	if get_node("../Player").state == 0:
		if is_up:
			fan_speed = Vector2(0,0)
		if is_down:
			fan_speed = Vector2(0,0)
		if is_left:
			fan_speed = Vector2(-75,0)
		if is_right:
			fan_speed = Vector2(75,0)
	elif get_node("../Player").state == 1:
		if is_up:
			fan_speed = Vector2(0,-990)
		if is_down:
			fan_speed = Vector2(0,990)
		if is_left:
			fan_speed = Vector2(-500,0)
		if is_right:
			fan_speed = Vector2(500,0)
	else:
		if is_up:
			fan_speed = Vector2(0,-1000)
		if is_down:
			fan_speed = Vector2(0,1000)
		if is_left:
			fan_speed = Vector2(-9000,0)
		if is_right:
			fan_speed = Vector2(9000,0)
		
	if is_moved:
		get_node("../Player").velocity += fan_speed*delta

extends StaticBody2D

var is_player_inside: bool = false

func _process(delta: float) -> void:
	if is_player_inside and get_node("../Player").state == 0:
		get_tree().reload_current_scene()
	elif get_node("../Player").state == 0:
		get_node("CollisionShape2D").position.y = 0
	else:
		get_node("CollisionShape2D").position.y = 1000000
	
	
	
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player") and body.state != 0:
		is_player_inside = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		is_player_inside = false

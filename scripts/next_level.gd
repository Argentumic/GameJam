extends Node2D

@export var next_scene_name: String

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		$"../Player".get_node("State Indicator/AnimationPlayer").play("transition_Start_2")

extends Node2D

@export var next_scene_name: String

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		get_tree().change_scene_to_file("res://levels/" + next_scene_name)

extends Area2D


func _on_body_entered(body: Node2D) -> void:
	Checkpoint.last_position = global_position

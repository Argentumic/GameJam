extends Area2D

var is_activated = false

func _on_body_entered(body: Node2D) -> void:
	Checkpoint.last_position = global_position
	$"../AnimatedSprite2D".play("activate")
	is_activated = true

func _process(delta: float) -> void:
	if is_activated and !$"../AnimatedSprite2D".is_playing():
		$"../AnimatedSprite2D".play("active")

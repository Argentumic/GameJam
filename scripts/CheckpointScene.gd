extends Area2D

var is_activated = false

func _on_body_entered(body: Node2D) -> void:
	Checkpoint.last_position = global_position
	if !is_activated:
		$"../AnimatedSprite2D".play("activate")
		is_activated = true

func _process(delta: float) -> void:
	if global_position.x < Checkpoint.last_position.x:
		$"../AnimatedSprite2D".play("active")
	if is_activated and !$"../AnimatedSprite2D".is_playing() and $"../AnimatedSprite2D".animation == "activate":
		$"../AnimatedSprite2D".play("active")

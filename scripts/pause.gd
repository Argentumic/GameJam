extends Panel

var is_opened: bool = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Pause"):
		togglePause()


func _on_exit_button_pressed() -> void:
	get_tree().quit()


func _on_play_button_pressed() -> void:
	togglePause()

func togglePause():
	visible = !is_opened
	get_tree().paused = !is_opened
	is_opened = visible
	

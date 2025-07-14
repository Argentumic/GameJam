extends Control

func _ready() -> void:
	$Time.text = "Your time is "+SpeedruntTimerGlobal.SpeedrunTime+" seconds"


func _on_button_pressed() -> void:
	get_tree().quit()

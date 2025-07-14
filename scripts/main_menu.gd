extends Control


const LEVEL_MUSIC = preload("res://Summer game jam piece one.mp3")

func _ready() -> void:
	AudioPlayer.play_music(LEVEL_MUSIC)


func _on_play_button_pressed() -> void:
	AudioPlayer.stop()
	$TextureRect/AnimationPlayer.stop()
	$AnimationPlayer.play("StartGame")
	

func goto_level_one():
	get_tree().change_scene_to_file("res://levels/Level1.tscn")

func _on_exit_button_pressed() -> void:
	get_tree().quit()

extends Node2D

const LEVEL_MUSIC = preload("res://Summer game jam piece two.mp3")

func _enter_tree() -> void:
	if Checkpoint.last_position:
		$Player.global_position = Checkpoint.last_position

func _ready() -> void:
	AudioPlayer.play_music(LEVEL_MUSIC)

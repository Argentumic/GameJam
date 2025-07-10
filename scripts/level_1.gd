extends Node2D

const LEVEL_MUSIC = preload("res://Summer game jam piece 1.mp3")

func _ready() -> void:
	AudioPlayer.play_music(LEVEL_MUSIC)

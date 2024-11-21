extends Node2D

@onready var cutscene_1: VideoStreamPlayer = $cutscene1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	cutscene_1.play()

func _process(delta: float) -> void:
	if(cutscene_1.finished):
		SceneManager.change_scene("res://scenes/enemy/mangkukulam/boss_manananggal/map_level_2_boss.tscn")

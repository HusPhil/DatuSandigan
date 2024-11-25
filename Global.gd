extends Node

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var main_scene
var player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.player = self
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

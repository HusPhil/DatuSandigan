extends VideoStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_finished() -> void:
	SceneManager.change_scene("C:/Users/HusPhil/Desktop/HackNSlash/scenes/maps/testMap.tscn")
	pass # Replace with function body.

extends Control

func _ready() -> void:
	$AnimationPlayer.play("RESET")
func resume():
	get_tree().paused = !get_tree().paused
	$AnimationPlayer.play_backwards("blur")
	self.visible = false
	
func pause():
	get_tree().paused = true
	$AnimationPlayer.play("blur")
	self.visible = true
	
	
func testEsc():
	if Input.is_action_just_pressed("pause_menu") and !get_tree().paused:
		pause()
	elif Input.is_action_just_pressed("pause_menu") and get_tree().paused:
		resume()

func _on_resume_pressed() -> void:
	resume()

func _on_restart_pressed() -> void:
	resume()
	get_tree().reload_current_scene()


func _on_quit_pressed() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	testEsc()

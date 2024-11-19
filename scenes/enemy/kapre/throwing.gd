extends KapreState

func enter(previous_state_path: String, data := {}) -> void:
	enemy.animation_player.play(idle_animation)
	enemy.current_state = SMASHING

	pass

func physics_update(_delta : float) -> void:
	enemy.velocity.y += 500 * _delta
	super.face_player()
	enemy.move_and_slide()
	pass
	


func _on_timer_timeout() -> void:
	enemy.player.camera.apply_shake(30.0)
	pass # Replace with function body.

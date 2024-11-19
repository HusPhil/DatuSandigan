extends KapreState

func enter(previous_state_path: String, data := {}) -> void:
	enemy.animation_player.play(idle_animation)
	enemy.state_label.text = "IDLE"
	enemy.hit_box_shape.disabled = false
	enemy.current_state = IDLE
	pass

func physics_update(_delta : float) -> void:
	enemy.velocity.y += 500 * _delta
	enemy.move_and_slide()
	finished.emit(DASHING)
	pass
	


func _on_kapre_is_enraged() -> void:
	#prepare_atk.stop()
	finished.emit(TELEPORT1)
	pass # Replace with function body.

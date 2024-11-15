extends EnemyState

func enter(previous_state_path: String, data := {}) -> void:
	enemy.velocity.x = 0.0
	pass
	#enemy.state_label.text = "Idle"
	#playback.travel("Move")
	

func physics_update(_delta: float) -> void:
	enemy.velocity.y += enemy.base_gravity * _delta
	enemy.move_and_slide()
	pass

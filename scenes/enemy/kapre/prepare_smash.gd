extends KapreState

@onready var prepare_atk : Timer = $Timer

const FRICTION : float = 10

func enter(previous_state_path: String, data := {}) -> void:
	prepare_atk.start()
	enemy.player.camera.apply_shake(SMASH_SHAKE)
	enemy.state_label.text = "Prepare Smashing"
	
	enemy.current_state = PREPARE_SMASH
	pass

## Called by the state machine on the engine's physics update tick.
func physics_update(_delta: float) -> void:
	var direction = -1 if enemy.sprite.flip_h else 1
	
	if enemy.velocity.x != 0:
		enemy.velocity.x -= FRICTION * direction
		
	enemy.velocity.y += JUMP_IMPULSE * _delta
	enemy.move_and_slide()

func _on_timer_timeout() -> void:
	enemy.velocity.y = -JUMP_IMPULSE
	face_player()
	finished.emit(SMASHING)
	pass # Replace with function body.

func exit() -> void:
	#cleanup
	prepare_atk.stop()
	

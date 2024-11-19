extends KapreState

@onready var prepare_atk : Timer = $Timer

const FRICTION : float = 10

func enter(previous_state_path: String, data := {}) -> void:
	
	enemy.animation_player.play(prepare_smash_animation)
	enemy.player.camera.apply_shake(SMASH_SHAKE)
	enemy.state_label.text = "Prepare Smashing"
	
	enemy.current_state = PREPARE_SMASH
	pass

## Called by the state machine on the engine's physics update tick.
func physics_update(_delta: float) -> void:
	
	var direction = -1 if enemy.sprite.flip_h else 1
	
	if enemy.velocity.x != 0:
		enemy.velocity.x -= FRICTION * direction
	else:
		face_player()
		
	enemy.velocity.y += JUMP_IMPULSE * _delta
	enemy.move_and_slide()

func _on_timer_timeout() -> void:
	pass # Replace with function body.

func _on_kapre_is_enraged() -> void:
	prepare_atk.stop()
	finished.emit(TELEPORT1)
	pass # Replace with function body.


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == prepare_smash_animation:
		enemy.velocity.y = -JUMP_IMPULSE
		face_player()
		finished.emit(SMASHING)
	pass # Replace with function body.

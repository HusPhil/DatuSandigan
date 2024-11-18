extends KapreState

#@onready var prepare_tmr : Timer = $Timer

const SMASH_GRAVITY: float = 10.0


var smash_count = 0
var has_jumped = false

func enter(previous_state_path: String, data := {}) -> void:
	has_jumped = false
	enemy.state_label.text = "Smashing"
	print("has_jumped ", has_jumped)
	
	enemy.current_state = SMASHING
	pass

## Called by the state machine on the engine's physics update tick.
func physics_update(_delta: float) -> void:
	var direction = -1 if enemy.sprite.flip_h else 1
	
	if enemy.is_on_floor():
		if has_jumped:
			finished.emit(DASHING)
		enemy.player.camera.apply_shake(SMASH_SHAKE)
	else:
		enemy.velocity.x = enemy.speed * direction
		
	enemy.velocity.y += JUMP_IMPULSE * _delta
	enemy.move_and_slide()

	if enemy.velocity.y >= 0:
		has_jumped = true
		enemy.velocity.y += SMASH_GRAVITY * _delta
		pass
		
		
#func exit() -> void:
	#has_jumped = false
	#pass

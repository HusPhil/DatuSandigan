extends KapreState

#@onready var prepare_tmr : Timer = $Timer
@onready var jump: AudioStreamPlayer2D = $"../../AudioStreamPlayer2D"

const SMASH_GRAVITY: float = 10.0


var smash_count = 0
var has_jumped = false

func enter(previous_state_path: String, data := {}) -> void:
	has_jumped = false
	enemy.current_state = SMASHING
	enemy.animation_player.play(smash_animation)
	jump.play()
	pass

## Called by the state machine on the engine's physics update tick.
func physics_update(_delta: float) -> void:
	var direction = -1 if enemy.sprite.flip_h else 1
	
	if enemy.is_on_floor():
		if has_jumped:
			enemy.animation_player.play(smash_done_animation)
			
		enemy.player.camera.apply_shake(SMASH_SHAKE)
	else:
		enemy.velocity.x = enemy.speed * direction
		
	enemy.velocity.y += JUMP_IMPULSE * _delta
	enemy.move_and_slide()

	if enemy.velocity.y >= 0:
		has_jumped = true
		enemy.velocity.y += SMASH_GRAVITY * _delta
		pass

func _on_kapre_is_enraged() -> void:
	#prepare_atk.stop()
	finished.emit(TELEPORT1)
	pass # Replace with function body.


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == smash_done_animation:
		finished.emit(DASHING)
	pass # Replace with function body.

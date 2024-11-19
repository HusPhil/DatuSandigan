extends KapreState

@onready var prepare_atk : Timer = $Timer

const FRICTION : float = 10
const DASH_SPEED: float = 600.0

const tree_pos_x = 368	
const tree_pos_y = 143

var has_jumped: bool = false

func enter(previous_state_path: String, data := {}) -> void:
	enemy.state_label.text = TELEPORT1
	enemy.current_state = TELEPORT1
	enemy.velocity.x = 0
	enemy.animation_player.play(prepare_teleport_animation)
	
## Called by the state machine on the engine's physics update tick.
func physics_update(_delta: float) -> void:
	if not enemy.is_on_floor():
		enemy.velocity.y += enemy.base_gravity * _delta
		enemy.move_and_slide()
	
	if not enemy.is_on_floor() and roundf(enemy.velocity.y) == 0:
		enemy.position.x = tree_pos_x
	elif enemy.is_on_floor() and has_jumped:
		enemy.player.camera.apply_shake(12.3)
		finished.emit(PREPARE_SMASH)

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == prepare_teleport_animation:
		enemy.velocity.y = -JUMP_IMPULSE * 3
		has_jumped = true
		enemy.move_and_slide()
		

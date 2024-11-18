extends KapreState

@onready var prepare_atk : Timer = $Timer

const FRICTION : float = 10
const DASH_SPEED: float = 600.0

func enter(previous_state_path: String, data := {}) -> void:
	prepare_atk.start()
	enemy.state_label.text = TELEPORT1
	enemy.current_state = TELEPORT1

## Called by the state machine on the engine's physics update tick.
func physics_update(_delta: float) -> void:
	if prepare_atk.is_stopped():
		enemy.velocity.y = -500
		print(prepare_atk.time_left)
	pass
	if not enemy.is_on_floor():
		enemy.velocity.y += 500 * _delta
	enemy.move_and_slide()

func exit() -> void:
	#enemy.hit_box_shape.disabled = true
	pass

extends PlayerState

var prev_vel_x : float

@onready var dash_tmr : Timer = $dash_tmr
const DASH_SPEED : float = 500.0
var prev_state : String

func enter(previous_state_path: String, data := {}) -> void:
	dash_tmr.start()
	player.state_label.text = "Dashing"
	prev_vel_x = player.velocity.x
	prev_state = previous_state_path
	
	player.move_and_slide()
	
func physics_update(_delta: float) -> void:
	var input_direction_x := -1 if player.sprite.flip_h else 1
	
	player.velocity.x = DASH_SPEED	* input_direction_x
	player.velocity.y += player.base_gravity * _delta
	
	player.handle_change_direction()
	player.move_and_slide()

	
	pass


func _on_player_is_hurt(attack: Attack) -> void:
	finished.emit(HURTING, {"attack": attack})
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	player.move_and_slide()
	finished.emit(prev_state)
	pass # Replace with function body.


func _on_dash_tmr_timeout() -> void:
	pass # Replace with function body.

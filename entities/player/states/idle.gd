extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	player.playback.travel(get_animation_name(Animations.idle))
	player.debug_label.text = get_animation_name(Animations.idle)
	pass
	
func physics_update(_delta: float) -> void:
	player.velocity.y += player.base_gravity * _delta
	player.move_and_slide()
	
	if not player.is_on_floor():
		finished.emit(get_state_name(States.FALLING))
	elif Input.is_action_just_pressed("jump"):
		finished.emit(get_state_name(States.JUMPING))
	elif Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right"):
		finished.emit(get_state_name(States.RUNNING))

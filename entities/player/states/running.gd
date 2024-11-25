extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	player.playback.travel(get_animation_name(Animations.run))
	player.debug_label.text = get_animation_name(Animations.run)
	pass

func physics_update(delta: float) -> void:
	var input_direction_x := Input.get_axis("move_left", "move_right")

	player.velocity.x = player.SPEED * input_direction_x
	player.velocity.y += Global.gravity * delta
	
	player.handle_change_direction()
	player.move_and_slide()

	if not player.is_on_floor():
		finished.emit(get_state_name(States.FALLING))
	elif Input.is_action_just_pressed("jump"):
		finished.emit(get_state_name(States.JUMPING))
	elif is_equal_approx(input_direction_x, 0.0):
		finished.emit(get_state_name(States.IDLE))

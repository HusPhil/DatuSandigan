extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	playback.travel(jump_animation)
	player.state_label.text = "Jumping"

	player.velocity.y = -player.jump_impulse

func physics_update(delta: float) -> void:
	var input_direction_x := Input.get_axis("move_left", "move_right")
	
	if input_direction_x:
		player.sprite.flip_h = input_direction_x < 0
	player.velocity.x = player.speed * input_direction_x
	player.velocity.y += player.base_gravity * delta
	player.move_and_slide()
	
	#print("CAN DJUMP: " + str(player.can_double_jump))
	
	if Input.is_action_just_pressed("jump"):
		double_jump()
		return
	if player.velocity.y >= 0:
		finished.emit(FALLING)

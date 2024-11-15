extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	player.state_label.text = "FALLING"
	playback.travel(fall_animation)


func physics_update(delta: float) -> void:
	var input_direction_x := Input.get_axis("move_left", "move_right")
	
	if input_direction_x:
		player.sprite.flip_h = input_direction_x < 0
		player.weapon_sprite.flip_h = input_direction_x < 0


	player.velocity.x = player.speed * input_direction_x
	player.velocity.y += player.base_gravity * delta
	player.move_and_slide()

	
	if Input.is_action_just_pressed("jump"):
		double_jump()

	if player.is_on_floor():
		if is_equal_approx(input_direction_x, 0.0):			
			finished.emit(IDLE)
		else:
			finished.emit(RUNNING)
		player.can_double_jump = true

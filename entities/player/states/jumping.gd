extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	player.playback.travel(get_animation_name(Animations.jump))
	player.velocity.y = -player.jump_impulse
	player.debug_label.text = get_animation_name(Animations.jump)

func physics_update(delta: float) -> void:
	var input_direction_x := Input.get_axis("move_left", "move_right")
	
	player.handle_change_direction()
	player.velocity.x = player.SPEED * input_direction_x
	player.velocity.y += player.base_gravity * delta
	


	#if Input.is_action_just_pressed("jump"):
		#double_jump()
		#return
	#if Input.is_action_just_pressed("attack2"):
		#player.shoot()
		#return
		
	if player.velocity.y >= 0:
		finished.emit(get_state_name(States.FALLING))
	
	player.move_and_slide()
		

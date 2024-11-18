extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	playback.travel(jump_animation)
	player.state = player.States.JUMPING
	player.state_label.text = "Jumping"

	player.velocity.y = -player.jump_impulse

func physics_update(delta: float) -> void:
	var input_direction_x := Input.get_axis("move_left", "move_right")
	
	player.handle_change_direction()
	player.velocity.x = player.speed * input_direction_x
	player.velocity.y += player.base_gravity * delta
	player.move_and_slide()


	if Input.is_action_just_pressed("jump"):
		double_jump()
		return
	if Input.is_action_just_pressed("attack2"):
		player.shoot()
		return
		
	if player.velocity.y >= 0:
		finished.emit(FALLING)
		
		


func _on_player_is_hurt(attack: Attack) -> void:
	finished.emit(HURTING, {"attack": attack})
	pass # Replace with function body.

extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	player.state_label.text = "Idle"
	playback.travel("Move")
	player.velocity.x = 0.0


func physics_update(_delta: float) -> void:
	player.velocity.y += player.base_gravity * _delta
	player.move_and_slide()
	
	var input_direction_x := Input.get_axis("move_left", "move_right")
	
	if input_direction_x:
		player.sprite.flip_h = input_direction_x < 0
		player.weapon_sprite.flip_h = input_direction_x < 0

	if not player.is_on_floor():
		#finished.emit(FALLING)
		pass
	elif Input.is_action_just_pressed("jump"):
		finished.emit(JUMPING)
	elif Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right"):
		finished.emit(RUNNING)
	elif Input.is_action_just_pressed("attack"):
		finished.emit(BASE_ATK1)

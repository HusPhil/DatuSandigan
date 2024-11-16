extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	player.state_label.text = "Running"
	playback.travel("Move")

	pass

func physics_update(delta: float) -> void:
	var input_direction_x := Input.get_axis("move_left", "move_right")

	player.velocity.x = player.speed * input_direction_x
	player.velocity.y += player.base_gravity * delta
	
	player.handle_change_direction()
	player.move_and_slide()

	if not player.is_on_floor():
		finished.emit(FALLING)
	elif Input.is_action_just_pressed("jump"):
		finished.emit(JUMPING)
	elif is_equal_approx(input_direction_x, 0.0):
		finished.emit(IDLE)
	elif Input.is_action_just_pressed("attack"):
		if player.current_weapon.type == Item.wp_types.spell_book:
			finished.emit(MAGIC_ATK)
		elif player.current_weapon.type in [Item.wp_types.sword, Item.wp_types.arnis]:
			finished.emit(BASE_ATK1)

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
	elif Input.is_action_just_pressed("attack"):
		if player.current_weapon.type == Item.wp_types.spell_book:
			finished.emit(MAGIC_ATK)
		elif player.current_weapon.type in [Item.wp_types.sword, Item.wp_types.arnis]:
			finished.emit(BASE_ATK1)
		
	if player.velocity.y >= 0:
		finished.emit(FALLING)
		
		


func _on_player_is_hurt(attack: Attack) -> void:
	finished.emit(HURTING, {"attack": attack})
	pass # Replace with function body.

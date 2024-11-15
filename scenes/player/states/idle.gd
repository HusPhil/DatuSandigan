extends PlayerState



func enter(previous_state_path: String, data := {}) -> void:
	player.state_label.text = "Idle"
	player.velocity.x = 0.0
	playback.travel("Move")
	
	


func physics_update(_delta: float) -> void:
	player.velocity.y += player.base_gravity * _delta
	player.move_and_slide()
	
	player.handle_change_direction()
	
	if playback.get_current_node() != "Move":
		playback.travel("Move")
		

	if not player.is_on_floor():
		finished.emit(FALLING)
		pass
	elif Input.is_action_just_pressed("jump"):
		finished.emit(JUMPING)
	elif Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right"):
		finished.emit(RUNNING)
	elif Input.is_action_just_pressed("attack"):
		if player.current_weapon.type == Item.wp_types.spell_book:
			finished.emit(MAGIC_ATK)
		elif player.current_weapon.type == Item.wp_types.sword:
			finished.emit(BASE_ATK1)
		
		

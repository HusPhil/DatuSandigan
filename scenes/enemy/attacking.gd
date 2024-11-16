extends EnemyState

# when enemy is idle it is wandering
# this is where we will detect if the enemy has detected the player
# define a point for where the enemy will wander
# once the enemy has seen the player, it will never stop chasing it



func enter(previous_state_path: String, data := {}) -> void:
	enemy.animation_player.play(attack_animation)
	#enemy.state_label.text = "ATTACKING"
	pass

func physics_update(delta : float) -> void:
	var collision_point = enemy.ray_cast.get_collision_point()
	var origin = enemy.ray_cast.global_transform.origin
	var distance = origin.distance_to(collision_point)
	
	enemy.state_label.text = str(distance)
	
	if distance >= 26:
		finished.emit(CHASING)
	

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == attack_animation:
		finished.emit(CHASING)
		print(anim_name)
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	finished.emit(CHASING)
	stop_chase()
	pass # Replace with function body.

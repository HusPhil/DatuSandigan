extends EnemyState

# when enemy is idle it is wandering
# this is where we will detect if the enemy has detected the player
# define a point for where the enemy will wander
# once the enemy has seen the player, it will never stop chasing it

func enter(previous_state_path: String, data := {}) -> void:
	enemy.state_label.text = "CHASING"
	enemy.animation_player.play(run_animation)
	pass

func physics_update(_delta: float) -> void:
	enemy.velocity = enemy.velocity.move_toward(enemy.direction * enemy.CHASE_SPEED, enemy.ACCELERATION * _delta)
	look_for_player()
	change_direction()
	
	if not enemy.ray_cast.is_colliding():
		stop_chase()
		
	enemy.move_and_slide()
	pass

func exit() -> void:
	pass


func _on_timer_timeout() -> void:
	finished.emit(WANDERING)
	pass # Replace with function body.

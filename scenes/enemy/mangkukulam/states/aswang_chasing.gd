extends EnemyState

# when enemy is idle it is wandering
# this is where we will detect if the enemy has detected the player
# define a point for where the enemy will wander
# once the enemy has seen the player, it will never stop chasing it

var player_detected := true

func enter(previous_state_path: String, data := {}) -> void:
	enemy.state_label.text = "CHASING"
	enemy.animation_player.play(run_animation)
	pass

func physics_update(_delta: float) -> void:
	enemy.velocity = enemy.velocity.move_toward(enemy.direction * enemy.CHASE_SPEED, enemy.ACCELERATION * _delta)
	look_for_player()
	change_direction()
	
	if player_detected:
		finished.emit(ATTACKING)
		
	
	if not enemy.ray_cast.is_colliding():
		stop_chase()
	else:
		var collision_point = enemy.ray_cast.get_collision_point()  # Get the collision point
		var collider = enemy.ray_cast.get_collider()  # Get the collider object
		var distance = collision_point.distance_to(enemy.global_position)
		if distance <= 20:
			 # Calculate distance
			finished.emit(ATTACKING)
		
	enemy.move_and_slide()
	pass
	
func _on_detect_player_body_entered(body: Node2D) -> void:
	if body == enemy.player:
		
		enemy.sprite.flipped = enemy.global_position.x > body.global_position.x
		finished.emit(ATTACKING)
	pass # Replace with function body.

func exit() -> void:
	pass


func _on_timer_timeout() -> void:
	finished.emit(WANDERING)
	pass # Replace with function body.


func _on_aswang_is_damaged(attack: Attack) -> void:
	
	finished.emit(HURTING, {"attack": attack})
	pass # Replace with function body.


func _on_detect_player_body_exited(body: Node2D) -> void:
	player_detected = false
	pass # Replace with function body.

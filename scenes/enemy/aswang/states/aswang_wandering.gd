extends EnemyState

# when enemy is idle it is wandering
# this is where we will detect if the enemy has detected the player
# define a point for where the enemy will wander
# once the enemy has seen the player, it will never stop chasing it


func enter(previous_state_path: String, data := {}) -> void:
	enemy.state_label.text = "WANDERING"
	enemy.animation_player.play(run_animation)

func physics_update(_delta: float) -> void:
	enemy.velocity = enemy.velocity.move_toward(enemy.direction * enemy.speed, enemy.ACCELERATION * _delta)
	look_for_player()
	change_direction()
	enemy.move_and_slide()
	
func change_direction() -> void:
#	moving left
	if enemy.sprite.flip_h:
		if enemy.position.x >= enemy.left_bound.x:
			enemy.direction = Vector2(-1,0)
			return
			
		#flip the raycast and enemy sprite to left
		enemy.sprite.flip_h = false
		enemy.ray_cast.target_position = Vector2(WANDER_BOUNDS,0)
		return
		
	#moving right
	if enemy.position.x <= enemy.right_bound.x:
		enemy.direction = Vector2(1,0)
		return
	
#	flip to move right
	enemy.sprite.flip_h = true
	enemy.ray_cast.target_position = Vector2(-WANDER_BOUNDS,0)	
	pass
	

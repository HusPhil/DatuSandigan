extends EnemyState

# when enemy is idle it is wandering
# this is where we will detect if the enemy has detected the player
# define a point for where the enemy will wander
# once the enemy has seen the player, it will never stop chasing it


func enter(previous_state_path: String, data := {}) -> void:
	enemy.state_label.text = "WANDERING"
	enemy.animation_player.play(run_animation)

	
func change_direction() -> void:
#	moving left
	if enemy.sprite.flip_h:
		if enemy.position.x >= enemy.left_bound.x:
			enemy.direction = Vector2(-1,0)
			return
			
		#flip the raycast and enemy sprite to left
		enemy.sprite.flipped = false
		enemy.ray_cast.target_position = Vector2(WANDER_BOUNDS,0)
		return
		
	#moving right
	if enemy.position.x <= enemy.right_bound.x:
		enemy.direction = Vector2(1,0)
		return
	
#	flip to move right
	enemy.sprite.flipped = true
	enemy.ray_cast.target_position = Vector2(-WANDER_BOUNDS,0)	
	pass
	

func _on_aswang_is_damaged(attack: Attack) -> void:
	
	finished.emit(HURTING, {"attack": attack})
	#enemy.plouy()
	pass # Replace with function body.

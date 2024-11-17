extends EnemyState

# when enemy is idle it is wandering
# this is where we will detect if the enemy has detected the player
# define a point for where the enemy will wander
# once the enemy has seen the player, it will never stop chasing it

func enter(previous_state_path: String, data := {}) -> void:
	enemy.velocity.x = 0.0
	pass
	#enemy.state_label.text = "Idle"
	#playback.travel("Move")
	

func physics_update(_delta: float) -> void:
	enemy.velocity.y += enemy.base_gravity * _delta
	enemy.move_and_slide()
	enemy.velocity = enemy.velocity.move_toward(enemy.direction * enemy.speed, enemy.ACCELERATION * _delta)
	pass

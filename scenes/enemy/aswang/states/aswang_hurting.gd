extends EnemyState

# when enemy is idle it is wandering
# this is where we will detect if the enemy has detected the player
# define a point for where the enemy will wander
# once the enemy has seen the player, it will never stop chasing it
#
var attack : Attack 
const HURT_GRAVITY = 10
const HURT_FRICTION = 10
@onready var knockback_tmr : Timer = $Timer
#
#
func enter(previous_state_path: String, data := {}) -> void:
	attack = data.get("attack") as Attack
	if attack and knockback_tmr.is_stopped():
		enemy.state_label.text = str(attack.knockback_force)
		attack.knockBack(3)
		knockback_tmr.start()
	pass
	
func physics_update(delta : float):
	if not enemy.is_on_floor():
		enemy.velocity += Vector2.DOWN * HURT_GRAVITY
	else:
		enemy.velocity.x = lerpf(enemy.velocity.x, 0, HURT_FRICTION * delta)

	enemy.move_and_slide()
#
func _on_timer_timeout() -> void:
	finished.emit(CHASING)
	print("DONE NA")
	#pass # Replace with function body.

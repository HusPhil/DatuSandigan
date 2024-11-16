extends PlayerState

var attack : Attack 
const HURT_GRAVITY = 100
const HURT_FRICTION = 10

func enter(previous_state_path: String, data := {}) -> void:
	attack = data.get("attack") as Attack
	pass

func physics_update(delta : float):
	if not player.is_on_floor():
		player.velocity += Vector2.DOWN * HURT_GRAVITY
	else:
		player.velocity.x = lerpf(player.velocity.x, 0, HURT_FRICTION * delta)
	
	finished.emit(IDLE)
	
	if attack:
		attack.knockBack(0.05)
		player.state_label.text = "dmg: " + str(attack.atk_damage)
	#else:
		#pass
	pass
		

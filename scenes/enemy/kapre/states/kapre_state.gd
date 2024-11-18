class_name KapreState extends EnemyState

const JUMP_VELOCITY = -400.0
const JUMP_IMPULSE: float = 500.0
const SMASH_SHAKE = 10.1

const SMASHING = "Smashing"
const PREPARE_SMASH = "PrepareSmash"
const DASHING = "Dashing"
const THROWING = "Throwing"
const IDLE = "Idle"
const TELEPORT1 = "Teleport1"

var rage_on = false

func _process(delta: float) -> void:
	if enemy.health <= enemy.max_health / 2 and not rage_on:
		rage_on = true		
		finished.emit(TELEPORT1)
		

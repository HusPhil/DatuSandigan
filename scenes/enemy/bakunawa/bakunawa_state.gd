class_name BakunawaState extends EnemyState

const JUMP_VELOCITY = -400.0
const JUMP_IMPULSE: float = 500.0
const SMASH_SHAKE = 10.1

const SMASHING = "Smashing"
const PREPARE_SMASH = "PrepareSmash"
const DASHING = "Dashing"
const THROWING = "Throwing"
const IDLE = "Idle"
const SMOKING = "Smoking"
const HEALING = "Healing"
const CASTING_MAGIC_BALL = "CastingMagicball"
const HEAVY_CAST = "HeavyCast"
const BEAM_ATTACK = "BeamAttack"


const prepare_smash_animation = "prepare_smash"
const prepare_teleport_animation = "prepare_teleport"
const smash_animation = "smash"
const smash_done_animation = "smash_done"
const dash_animation = "dash"
const teleport1_animation = "teleport1"
const smoking_animation = "smoking"
const casting_animation = "casting"
const melee_animation = "melee"
const heavy_casting_animation = "heavy_casting"
const beam_attack_animation = "beam_attack"
const shoot_animation = "shoot"

var rage_on = false


func update(delta: float) -> void:
	if enemy.health <= (enemy.max_health / 2) and not rage_on:
		rage_on = true
		enemy.is_enraged.emit()
		
func physics_update(_delta: float) -> void:
	pass

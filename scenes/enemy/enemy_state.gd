class_name EnemyState extends State

@export var enemy: Enemy

const WANDERING = "Wandering"
const RUNNING = "Running"
const ATTACKING = "Attacking"
const MELEE = "Melee"
const CHASING = "Chasing"
const HURTING = "Hurting"

const run_animation := "run"
const idle_animation := "idle"
const attack_animation := "attack"

const WANDER_BOUNDS = 120

func _ready() -> void:
	await owner.ready
	enemy = owner as Enemy
	assert(enemy != null, "The EnemyState state type must be used only in the enemy scene. It needs the owner to be a Enemy node.")

func physics_update(_delta: float) -> void:
	enemy.velocity = enemy.velocity.move_toward(enemy.direction * enemy.speed, enemy.ACCELERATION * _delta)
	look_for_player()
	change_direction()
	enemy.move_and_slide()

func look_for_player() -> void:
	if enemy.ray_cast.is_colliding():
		var collider = enemy.ray_cast.get_collider()
		if collider == enemy.player:
			chase_player()
		

func chase_player() -> void:
	enemy.timer.stop()
	finished.emit(CHASING)
	pass

func stop_chase() -> void:
	if enemy.timer.time_left <= 0:
		enemy.timer.start()

func change_direction() -> void:
	enemy.direction = (enemy.player.position - enemy.position).normalized()
	enemy.direction = sign(enemy.direction)
	
	if enemy.direction.x == 1:
		#flip to right
		enemy.sprite.flipped = false
		enemy.ray_cast.target_position = Vector2(WANDER_BOUNDS, 0)
		return
	
	#flip to move left
	enemy.sprite.flipped = true
	enemy.ray_cast.target_position = Vector2(-WANDER_BOUNDS, 0)	
	pass

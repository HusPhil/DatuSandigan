extends MangkukulamState

@onready var atk_tmr : Timer = $Timer
const FLY_SPEED := 10.2
const MAX_FLY_HEIGHT := 150.5
var can_fly = false

func enter(previous_state_path: String, data := {}) -> void:
	playback.travel(idle_animation)
	atk_tmr.start()
	enemy.state_label.text = "IDLE"
	pass
	
func physics_update(_delta : float) -> void:
	print(enemy.spawned_enemies)
	for spawned_enemy in enemy.spawned_enemies:
		if spawned_enemy.is_queued_for_deletion():
			enemy.spawned_enemies.erase(spawned_enemy)
			pass
	
	if not enemy.spawned_enemies:
		print("SPAWN KA PA ULI")
		finished.emit(SPAWNING)

func _on_timer_timeout() -> void:
	can_fly = true
	face_player()
	if !rage_on:
		if not enemy.spawned_enemies:
			print("BUMALIK NA DIN AGAD")
			finished.emit(SPAWNING)
	else:
		finished.emit(CASTING)
	pass # Replace with function body.

extends MangkukulamState

@onready var atk_tmr : Timer = $Timer
const FLY_SPEED := 10.2
const MAX_FLY_HEIGHT := 150.5
var can_fly = false

func enter(previous_state_path: String, data := {}) -> void:
	playback.travel(idle_animation)
	atk_tmr.start()
	pass


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

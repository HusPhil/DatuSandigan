extends MangkukulamState


@onready var atk_tmr : Timer = $Timer

func enter(previous_state_path: String, data := {}) -> void:
	playback.travel(idle_animation)
	atk_tmr.start()
	enemy.state_label. text = "IDLE"
	pass

	
func physics_update(_delta : float):
	print("WHAT IS HEAPP")
	if atk_tmr.is_stopped():
		if !rage_on:
			finished.emit([CASTING, SPAWNING].pick_random())
		else:
			finished.emit(BEAM_ATTACK) 
	
	pass
	

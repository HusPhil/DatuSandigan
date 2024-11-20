extends BakunawaState


@onready var atk_tmr : Timer = $Timer

func enter(previous_state_path: String, data := {}) -> void:
	playback.travel(idle_animation)
	atk_tmr.start()
	pass

	
func physics_update(_delta : float):
	if atk_tmr.is_stopped():
		finished.emit(CASTING_MAGIC_BALL)
	pass
	

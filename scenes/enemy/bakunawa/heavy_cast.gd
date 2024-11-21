extends BakunawaState

@onready var timer : Timer  = $Timer
const MAX_SAMPLES: int = 10
var record_live_index: int
var volume_samples: Array = []



func enter(previous_state_path: String, data := {}) -> void:
	playback
	pass


func physics_update(delta: float) -> void: 
	pass

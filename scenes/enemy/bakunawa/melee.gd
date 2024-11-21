extends BakunawaState

@onready var bodyslam: AudioStreamPlayer2D = $"../../bodyslam"

func enter(previous_state_path: String, data := {}) -> void:
	playback.travel(melee_animation)
	bodyslam.play()
	pass

func _on_animation_tree_animation_finished(anim_name: StringName) -> void:	
	if anim_name == melee_animation:
		finished.emit(IDLE)
	

extends BakunawaState

func enter(previous_state_path: String, data := {}) -> void:
	playback.travel(casting_animation)
	pass


func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if anim_name == casting_animation:
		playback.travel(shoot_animation)
		

	elif anim_name == shoot_animation:
		finished.emit(IDLE)
	pass # Replace with function body.

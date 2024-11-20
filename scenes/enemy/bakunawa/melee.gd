extends BakunawaState

func enter(previous_state_path: String, data := {}) -> void:
	playback.travel(melee_animation)
	enemy.state_label.text = "MELEE"
	pass

func _on_animation_tree_animation_finished(anim_name: StringName) -> void:	
	if anim_name == melee_animation:
		enemy.player.camera.apply_shake(12.34)
		finished.emit(IDLE)
	

extends BakunawaState

func enter(previous_state_path: String, data := {}) -> void:
	enemy.player.state_label.text = "HEAVY CATS"
	playback.travel(casting_animation)
	pass

func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if anim_name == casting_animation:
		
		if rage_on:
			playback.travel(attack_animation)
		
			return
			
			
		

	elif anim_name == shoot_animation:
		finished.emit(IDLE)
	pass # Replace with function body.

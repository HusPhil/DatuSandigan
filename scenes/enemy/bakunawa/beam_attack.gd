extends BakunawaState



func enter(previous_state_path: String, data := {}) -> void:
	playback.travel(beam_attack_animation)
	enemy.state_label.text = beam_attack_animation
	pass


func physics_update(delta: float) -> void: 
	pass


func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if anim_name == beam_attack_animation:
		finished.emit(IDLE)
	pass # Replace with function body.

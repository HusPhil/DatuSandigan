extends KapreState

func enter(previous_state_path: String, data := {}) -> void:
	enemy.animation_player.play(idle_animation)
	enemy.state_label.text = IDLE
	enemy.current_state = IDLE
	pass

func physics_update(_delta : float):
	if rage_on:
		#behaviourWhenEnrage(_delta)
		return
	behaviourWhenNotEnrage(_delta)
	
func behaviourWhenEnrage(_delta : float) -> void:
	#enemy.animation_player.play(smoking_animation)
	pass
	
func behaviourWhenNotEnrage(_delta : float) -> void:
	pass

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == smoking_animation and enemy.current_state == IDLE:
		#finished.emit(SMOKING)
		pass
	pass # Replace with function body.

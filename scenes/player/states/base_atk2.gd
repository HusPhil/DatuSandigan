extends PlayerState

@export var atk_timer : Timer
var next_state := BASE_ATK3
var atk_animation := base_atk2_animation

func enter(previous_state_path: String, data := {}) -> void:
	player.state_label.text = "ATTACKING 2"
	playback.travel(atk_animation)
	
	
func handle_input(_event: InputEvent) -> void:
	if _event.is_action_pressed("attack"):
		print(atk_animation)
		atk_timer.start()
	
	if _event.is_action_pressed("attack2"):
		playback.travel(ground_animation)
		finished.emit(IDLE)
		

func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	
	if anim_name == atk_animation:
		if atk_timer.is_stopped():
			playback.travel(ground_animation)
			finished.emit(IDLE)
		else:
			finished.emit(next_state)

extends PlayerState

@export var atk_timer : Timer
var next_state := IDLE
var atk_animation := base_atk3_animation

func enter(previous_state_path: String, data := {}) -> void:
	player.state_label.text = "ATTACKING 3"
	playback.travel(atk_animation)
	
func handle_input(_event: InputEvent) -> void:
	# No need to check for next attack since this is the last in combo
	pass

func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if anim_name == atk_animation:
		playback.travel(ground_animation)
		finished.emit(IDLE)

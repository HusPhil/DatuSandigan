extends PlayerState

@export var atk_timer : Timer
@export var item : Item
var next_state := BASE_ATK2
var atk_animation := base_atk1_animation

func enter(previous_state_path: String, data := {}) -> void:
	player.state_label.text = "ATTACKING 1"
	#playback.travel("sword_atk1")
	player.animation_player.play("sword_atk1")
	player.weapon_sprite.texture = player.current_weapon.texture
	player.weapon_animation_player.play(player.current_weapon.animation)
	
	
func handle_input(_event: InputEvent) -> void:
	if _event.is_action_pressed("attack"):
		print("ANOTHER PINDOT" + atk_animation)
		atk_timer.start()
	
	if _event.is_action_pressed("attack2"):
		playback.travel(ground_animation)
		finished.emit(IDLE)
		

#func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	#print("OUTSIDE AHA AHA")
	#
	#if anim_name == atk_animation or true:
		#if atk_timer.is_stopped():
			#print("AHA AHA")
			#playback.travel(ground_animation)
			#finished.emit(IDLE)
		#else:
			#finished.emit(next_state)

func _PLAYER_animation_finished(anim_name: StringName) -> void:
	#if anim_name == atk_animation or true:
	print("ano")
	if atk_timer.is_stopped():
		print("AHA AHA")
		playback.travel(ground_animation)
		finished.emit(IDLE)
	else:
		print("hihi")
		finished.emit(next_state)

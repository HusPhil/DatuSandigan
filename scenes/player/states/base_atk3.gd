extends PlayerState

@export var atk_timer : Timer
var next_state := IDLE
var COMBO_NUM = 3
var atk_animation : String = "fist"

func enter(previous_state_path: String, data := {}) -> void:
	player.state_label.text = "ATTACKING " + str(COMBO_NUM)
	atk_animation = Item.wp_types.find_key(player.current_weapon.type) + "_atk" + str(COMBO_NUM)
	playback.travel(atk_animation)
	player.weapon_sprite.texture = player.current_weapon.texture
	player.weapon_animation_player.play(player.current_weapon.animation + str(COMBO_NUM))
	
func handle_input(_event: InputEvent) -> void:
	# No need to check for next attack since this is the last in combo
	pass

func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	
	if anim_name == atk_animation:
		playback.travel(ground_animation)
		finished.emit(IDLE)

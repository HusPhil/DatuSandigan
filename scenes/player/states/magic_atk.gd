extends PlayerState

@export var atk_timer : Timer
var next_state := IDLE
var atk_animation : String = "magic"

func enter(previous_state_path: String, data := {}) -> void:
	player.state_label.text = "MAGIC_ATK"
	#DEPENDS ON THE ANIM TREE
	
	atk_animation = magic_atk_animation
	print(atk_animation)
	playback.travel(atk_animation)
	
	player.weapon_sprite.texture = player.current_weapon.texture
	player.weapon_animation_player.play(player.current_weapon.animation)
	
func handle_input(_event: InputEvent) -> void:
	# No need to check for next attack since this is the last in combo
	pass	

func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if anim_name == atk_animation:
		player.shoot_projectile()
		playback.travel(ground_animation)
		finished.emit(IDLE)

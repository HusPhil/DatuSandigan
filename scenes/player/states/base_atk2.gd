extends PlayerState

@export var atk_timer : Timer
@export var item : Item
var COMBO_NUM = 2
var next_state := BASE_ATK3
var atk_animation : String = "fist"
var has_attacked : bool

func enter(previous_state_path: String, data := {}) -> void:
	player.state_label.text = "ATTACKING " + str(COMBO_NUM)
	has_attacked = false
	atk_animation = Item.wp_types.find_key(player.current_weapon.type) + "_atk" + str(COMBO_NUM)
	playback.travel(atk_animation)
	player.weapon_sprite.texture = player.current_weapon.texture
	player.weapon_animation_player.play(player.current_weapon.animation + str(COMBO_NUM))
	
	
func handle_input(_event: InputEvent) -> void:
	if _event.is_action_pressed("attack"):
		atk_timer.start()
	
	if _event.is_action_pressed("attack2"):
		playback.travel(ground_animation)
		finished.emit(IDLE)
		
func _physics_process(delta: float) -> void:
	if has_attacked:
		print("😘😘FORCED TO IDLE STATE " + str(COMBO_NUM))
		playback.travel(ground_animation)
		finished.emit(IDLE)
	pass

func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	print("COMBO " + str(COMBO_NUM) + " :: " + anim_name )
	if anim_name == atk_animation:
		if atk_timer.is_stopped():
			print("IDLE transition")
			playback.travel(ground_animation)
			finished.emit(IDLE)
		else:
			print("TRANSITION TO COMBO " + str(COMBO_NUM + 1))
			finished.emit(next_state)

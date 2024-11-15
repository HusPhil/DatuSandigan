extends PlayerState

@export var atk_timer : Timer
@export var item : Item
var COMBO_NUM = 1
var next_state := BASE_ATK2
var atk_animation : String = "fist"
var has_attacked : bool
const MAX_SECS := 0.3
var current_secs := 0

func enter(previous_state_path: String, data := {}) -> void:
	player.state_label.text = "ATTACKING 1"
	has_attacked = false
	atk_animation = Item.wp_types.find_key(player.current_weapon.type) + "_atk" + str(COMBO_NUM)
	playback.travel(atk_animation)
	player.weapon_sprite.texture = player.current_weapon.texture
	player.weapon_animation_player.play(player.current_weapon.animation + "1")
	
	
func handle_input(_event: InputEvent) -> void:
	if _event.is_action_pressed("attack") and atk_timer.is_stopped():
		atk_timer.start()
	
	if _event.is_action_pressed("attack2") :
		playback.travel(ground_animation)
		finished.emit(IDLE)

func physics_update(_delta: float) -> void:
	#if player.state == ""
	current_secs += 1.0/60.0
	print(current_secs)
	if current_secs >= MAX_SECS:
		print("😘😘FORCED TO IDLE STATE " + str(COMBO_NUM))
		playback.travel(ground_animation)
		finished.emit(IDLE)

		

func _on_animation_tree_animation_finished(anim_name: StringName) -> void:	
	print("COMBO " + str(COMBO_NUM) + " :: " + anim_name )
	if anim_name == atk_animation:
		has_attacked = true
		if atk_timer.is_stopped():
			print("IDLE transition")
			playback.travel(ground_animation)
			finished.emit(IDLE)
		else:
			print("TRANSITION TO COMBO " + str(COMBO_NUM + 1))
			finished.emit(next_state)

func exit() -> void:
	has_attacked = false
	current_secs = 0.0
	print("NAKAEXIT NA sa  COMBO + " + str(COMBO_NUM))

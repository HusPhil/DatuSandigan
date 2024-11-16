extends PlayerState

var attack : Attack 
const HURT_GRAVITY = 10
const HURT_FRICTION = 10

@onready var knockback_tmr : Timer = $Timer

func enter(previous_state_path: String, data := {}) -> void:
	attack = data.get("attack") as Attack
	if attack and knockback_tmr.is_stopped():
		attack.knockBack(2)
		playback.travel(hurt_animation)
		player.state_label.text = "dmg: " + str(attack.atk_damage)
		knockback_tmr.start()
	pass
	
func physics_update(delta : float):
	if not player.is_on_floor():
		player.velocity += Vector2.DOWN * HURT_GRAVITY
	else:
		player.velocity.x = lerpf(player.velocity.x, 0, HURT_FRICTION * delta)
	
	player.move_and_slide()
	


func _on_timer_timeout() -> void:
	finished.emit(IDLE)
	print("DONE NA")
	pass # Replace with function body.


func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if anim_name == hurt_animation:
		finished.emit(IDLE)
		print("DONE NA")
	pass # Replace with function body.

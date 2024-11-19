extends KapreState

@onready var prepare_atk : Timer = $Timer

const FRICTION : float = 10
const DASH_SPEED: float = 600.0

func enter(previous_state_path: String, data := {}) -> void:
	prepare_atk.start()
	face_player()
	enemy.state_label.text = "PREPARE TO DASH"
	enemy.velocity.x = 0
	enemy.current_state = DASHING
	enemy.animation_player.play(idle_animation)
	pass

## Called by the state machine on the engine's physics update tick.
func physics_update(_delta: float) -> void:
	var direction = -1 if enemy.sprite.flip_h else 1
	if enemy.velocity.x != 0:
		enemy.velocity.x -= FRICTION * direction
		pass
		
	enemy.velocity.y += JUMP_IMPULSE * _delta
	enemy.move_and_slide()

func _on_timer_timeout() -> void:
	
	
	pass # Replace with function body.

func exit() -> void:
	
	face_player()
	#enemy.hit_box_shape.disabled = true
	pass


func _on_hit_box_component_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		var atk : Attack = Attack.new()
		atk.atk_damage = enemy.damage;
		atk.knockback_force = 100;
		atk.source_entity = enemy
		atk.target_entity = body as Player
		body.take_damage(atk);
		pass # Replace with function body.


func _on_kapre_is_enraged() -> void:
	prepare_atk.stop()
	finished.emit(TELEPORT1)
	pass # Replace with function body.


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == idle_animation:
		enemy.animation_player.play(dash_animation)
	elif anim_name == dash_animation:
		var direction = -1 if enemy.sprite.flip_h else 1
		enemy.velocity.x = DASH_SPEED * direction
		enemy.state_label.text = "DASH"
		enemy.move_and_slide()
		finished.emit(PREPARE_SMASH)
		
	pass # Replace with function body.

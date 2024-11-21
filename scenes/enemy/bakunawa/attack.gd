extends BakunawaState
@onready var cast: AudioStreamPlayer2D = $"../../cast"




func enter(previous_state_path: String, data := {}) -> void:
	playback.travel(casting_animation)
	cast.play()
	pass

func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if anim_name == casting_animation:

		playback.travel(shoot_animation)
		var missile := enemy.MagicBall.instantiate() as Projectile

		missile._target = enemy.player

		missile.lifetime = 5
		missile.initial_direction = enemy.spawnMagicPoint.rotation
		missile.global_position = enemy.global_position 

		missile.drag_factor = 0.15
		missile.max_speed = 500.0
		missile.scale *= 2

		print(missile._attack)
		
		add_child(missile)
		
	elif anim_name == shoot_animation:
		finished.emit(IDLE)
	pass # Replace with function body.

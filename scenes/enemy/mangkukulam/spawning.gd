extends MangkukulamState


@onready var atk_tmr : Timer = $Timer

func enter(previous_state_path: String, data := {}) -> void:
	enemy.state_label. text = "SPAWNING"
	playback.travel(spawning_animation)
	
	var enemy_to_spawn : PackedScene = [enemy.Aswang, enemy.Manananggal].pick_random()
	
	var spawnedEnemy = enemy.Aswang.instantiate()

	spawnedEnemy.global_position = enemy.player.global_position
	
	enemy.spawned_enemies.append(spawnedEnemy)
	pass

	
func physics_update(_delta : float):	
	pass
	


func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if anim_name == spawning_animation and name == SPAWNING:
		print("TRANSITION")
		finished.emit(IDLE)
		
	pass # Replace with function body.

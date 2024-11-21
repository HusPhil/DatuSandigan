extends MangkukulamState


@onready var atk_tmr : Timer = $Timer

func enter(previous_state_path: String, data := {}) -> void:
	enemy.state_label. text = "SPAWNING"
	playback.travel(spawning_animation)
	
	
	pass

	
func physics_update(_delta : float):	
	print(enemy.spawned_enemies)
	pass
	


func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if anim_name == spawning_animation and name == SPAWNING:
		print("TRANSITION")
		var enemy_to_spawn : PackedScene = [enemy.Aswang, enemy.Manananggal].pick_random()
	
		var spawnedEnemy = enemy.Aswang.instantiate() as Enemy

		spawnedEnemy.position = enemy.player.position
		spawnedEnemy.player = enemy.player
		enemy.get_parent().add_child(spawnedEnemy)
		
		enemy.spawned_enemies.append(spawnedEnemy)
		
		finished.emit(IDLE)
		
	pass # Replace with function body.

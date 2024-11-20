MangkukulamState extends EnemyState

func shootMagic() -> void:
	var missile := enemy.MagicBallScene.instantiate() as Projectile

		missile._target = enemy.player

		missile.lifetime = 5
		missile.initial_direction = enemy.spawnMagicPoint.rotation
		missile.global_position = enemy.global_position 

		missile.drag_factor = 0.15
		missile.max_speed = 500.0
		missile.scale *= 2

		print(missile._attack)
		
		enemy.player.camera.apply_shake(5.4)
		
		add_child(missile)

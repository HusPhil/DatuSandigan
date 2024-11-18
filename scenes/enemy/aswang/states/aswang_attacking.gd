extends EnemyState

# when enemy is idle it is wandering
# this is where we will detect if the enemy has detected the player
# define a point for where the enemy will wander
# once the enemy has seen the player, it will never stop chasing it

@onready var atk_tmr : Timer = $Timer

func enter(previous_state_path: String, data := {}) -> void:
	enemy.animation_player.play(attack_animation)
	enemy.state_label.text = "ATTACKING"
	atk_tmr.start()
	pass


func _on_timer_timeout() -> void:
	finished.emit(CHASING)
	pass # Replace with function body.
	
func _on_aswang_is_damaged(attack: Attack) -> void:
	finished.emit(HURTING, {"attack": attack})
	pass # Replace with function body.

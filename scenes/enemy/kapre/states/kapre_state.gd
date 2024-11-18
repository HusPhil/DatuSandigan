class_name KapreState extends EnemyState

var speed = 3000.0
const JUMP_VELOCITY = -400.0

func enter(previous_state_path: String, data := {}) -> void:
	enemy.state_label.text = "KAPRE WANDERING"
	enemy.animation_player.play(run_animation)

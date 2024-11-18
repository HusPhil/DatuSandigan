extends KapreState

func enter(previous_state_path: String, data := {}) -> void:
	enemy.state_label.text = "WANDERING"
	enemy.animation_player.play(run_animation)

func physics_update(_delta: float) -> void:
	super.physics_update(_delta)

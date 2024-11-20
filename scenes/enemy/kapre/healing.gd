extends KapreState

@onready var prepare_atk : Timer = $Timer

const FRICTION : float = 10
const DASH_SPEED: float = 600.0

func enter(previous_state_path: String, data := {}) -> void:
	enemy.animation_player.play(run_animation)
	pass

func exit() -> void:
	face_player()
	pass


func _on_smoking_area_body_entered(body: Node2D) -> void:
	if rage_on:
		finished.emit(SMOKING)
	pass # Replace with function body.

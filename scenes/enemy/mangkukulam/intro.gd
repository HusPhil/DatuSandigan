extends MangkukulamState

@onready var atk_tmr : Timer = $Timer
const FLY_SPEED := 10.2
const MAX_FLY_HEIGHT := 150.5
var can_fly = false

func enter(previous_state_path: String, data := {}) -> void:
	playback.travel(idle_animation)
	atk_tmr.start()
	enemy.state_label. text = "INTRO"
	face_player()
	pass

	
func physics_update(_delta : float):
	enemy.state_label.text = str(enemy.velocity.y)
	if not can_fly:
		enemy.move_and_slide()
		return
	
	if enemy.velocity.y <= -MAX_FLY_HEIGHT:
		finished.emit(IDLE)
		return
	
	enemy.velocity.y -= FLY_SPEED
	enemy.move_and_slide()
	pass
	


func _on_timer_timeout() -> void:
	can_fly = true
	pass # Replace with function body.

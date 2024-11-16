extends PlayerState

var attack : Attack 


func enter(previous_state_path: String, data := {}) -> void:
	attack = data.get("attack") as Attack
	pass

func physics_update(delta : float):
	if attack:
		player.state_label.text = "dmg: " + str(attack.atk_damage)
	
	pass
		

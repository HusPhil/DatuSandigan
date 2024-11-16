extends PlayerState

var attack : Attack 

func enter(previous_state_path: String, data := {}) -> void:
	
	attack = data.get("attack") as Attack
	if attack:
		player.state_label.text = "dmg: " + str(attack.atk_damage)
		print(attack.atk_damage)  # Access the attack object directly and print its atk_damage
	if player:
		player.state = player.States.HURTING
		print(player.NAME)
		print(previous_state_path)
	pass

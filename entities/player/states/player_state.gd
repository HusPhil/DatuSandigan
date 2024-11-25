class_name PlayerState extends State

enum States {
	IDLE,
	RUNNING,
	ATTACK,
	FALLING,
	JUMPING
}

enum Animations {
	idle,
	run,
	jump,
	fall,
	attack
}

func get_animation_name(anim_item: Animations) -> String:
	return Animations.find_key(anim_item)
	
func get_state_name(state_item: States) -> String:
	return States.find_key(state_item)

var player: Player

func _ready() -> void:
	await owner.ready
	player = owner as Player
	assert(player != null, "The PlayerState state type must be used only in the player scene. It needs the owner to be a Player node.")

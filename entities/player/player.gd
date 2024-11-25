class_name Player extends Entity

func _ready() -> void:
	animation_tree = $AnimationTree
	playback = animation_tree["parameters/playback"]
	debug_label = $DebugLabel
	sprite = $sprite_player
	base_gravity = Global.gravity * 50
	jump_impulse = 300.0
	
func handle_change_direction() -> void:
	var input_direction_x := Input.get_axis("move_left", "move_right")
	
	if input_direction_x:
		var is_flipped_direction = input_direction_x < 0
		sprite.flipped = is_flipped_direction

extends CollisionShape2D
class_name FlippableShape2d

@export var default_position : Vector2:
	set(new_position):
		default_position = new_position
		position = new_position
		

var current_flip_value : bool

func _on_sprite_flipped(flip_val : bool) -> void:
	if current_flip_value != flip_val:
		print("WHAT THE")
		position *= -1
		current_flip_value = flip_val
		

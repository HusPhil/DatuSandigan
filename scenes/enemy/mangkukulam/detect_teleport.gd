extends Area2D

@export var flippable_sprite: FlippableSprite
var on_right = true

func _ready():
	if flippable_sprite != null:
		for child in get_children():
			flippable_sprite.is_flipped.connect(child._on_sprite_flipped)
	
	
func _on_body_entered(body: Node2D) -> void:
	print(body.name)

	if body.name == "playerdapatito":
		var player_position = body.global_position
		var area_position = global_position
		
		var relative_x = player_position.x - area_position.x
		var distance_to_player = abs(relative_x)
		
		var teleport_direction = Vector2.LEFT if relative_x < 0 else Vector2.RIGHT
		var teleport_distance = distance_to_player * 2

		get_parent().global_position += teleport_distance * teleport_direction
		print("Player entered! Teleporting...")

func _on_body_exited(body: Node2D) -> void:
	print("working")
	if body == get_parent().player:
		print("player exited")
	

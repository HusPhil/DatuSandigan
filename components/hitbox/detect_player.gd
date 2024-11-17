extends Area2D
@export var flippable_sprite: FlippableSprite

func _ready():
	if flippable_sprite != null:
		for child in get_children():
			flippable_sprite.is_flipped.connect(child._on_sprite_flipped)
			


func _on_body_entered(body: Node2D) -> void:
	if body == get_parent().player:
		print("MAY PLAYER")
	pass # Replace with function body.

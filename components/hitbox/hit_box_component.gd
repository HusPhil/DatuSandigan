extends Area2D
class_name HitboxComponent

@export var flippable_sprite: FlippableSprite

func _ready():
	if flippable_sprite != null:
		for child in get_children():
			flippable_sprite.is_flipped.connect(child._on_sprite_flipped)
			child.disabled = true


func _on_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		#body.take_damage(get_parent().current_weapon.damage)
		pass # Replace with function body.


func _on_flippable_sprite_is_flipped(flip_val: Variant) -> void:
	pass # Replace with function body.

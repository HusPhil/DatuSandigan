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
		var entity := get_parent() 
		if entity is Enemy:
			body = body as Player
			var atk : Attack = Attack.new()
			atk.atk_damage = 100.0;
			atk.knockback_force = 40.0;
			atk.source_entity = entity
			atk.target_entity = body as CharacterBody2D
			body.take_damage(atk)
			return
			
		if entity is Player:
			var atk : Attack = Attack.new()
			atk.atk_damage = 100.0;
			atk.knockback_force = 30.0;
			atk.source_entity = entity
			atk.target_entity = body as CharacterBody2D
			body.take_damage(atk);
			
		pass # Replace with function body.

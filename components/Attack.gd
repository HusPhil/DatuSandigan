class_name Attack

var atk_damage : float
var knockback_force : float
var atk_position : Vector2
var target_entity : CharacterBody2D
var source_entity : CharacterBody2D

func knockBack(up_force : float):
	if not target_entity or not source_entity:
		printerr("NO SOURCE AND TARGET ENTITY")
		return
	
	if source_entity.global_position.x < target_entity.global_position.x:
		target_entity.velocity = Vector2(knockback_force * 2, -knockback_force * up_force)
		return
		
	target_entity.velocity = Vector2(-knockback_force * 2, -knockback_force * up_force)
	
	pass
 

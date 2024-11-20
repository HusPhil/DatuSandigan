extends Enemy

const MissileScene := preload("res://scenes/items/Missile.tscn")
const MagicBallScene := preload("res://scenes/magic_ball.tscn")


func _ready() -> void:
	# redefine the values from the enemy class	
	speed = 300
	max_health = 1000
	health = max_health
	animation_player = $AnimationPlayer
	smoke_fx = $SmokeFX
	hit_box_shape = $HitBoxComponent/FlippableShape
	state_label = $Label
	animation_tree = $AnimationTree
	spawnMagicPoint = $SpawnMagic
	state_label = $Label
	
	#hit_box_shape.disabled = false


func _on_hurt_box_component_body_entered(body: Node2D) -> void:
	print("HITBOx NG BAKUNAWA: ", body)
	if body is Projectile:
		var projectile = body as Projectile
		if projectile._is_deflected:
			queue_free()
	pass # Replace with function body.


func _on_hurt_box_component_area_entered(area: Area2D) -> void:
	print("AREA HITBOX NG BAKUNAWA: ", area.owner)
	if area.owner is Projectile:
		var projectile = area.owner as Projectile
		if projectile._is_deflected:
			self.state_label.text = "-dmg 10"
			projectile.queue_free()
	pass # Replace with function body.

extends Area2D
 
var direction : Vector2 = Vector2.RIGHT
var damage : float = 1
var velocity : float = 100.0


@onready var sprite : AnimatedSprite2D = $AnimatedSprite2D
 
func set_direction(flip_direction,frame):
	#sprite.flip_h = flip_direction
	#sprite.frame = frame
	if flip_direction == false:
		direction = Vector2.RIGHT
	else:
		direction = Vector2.LEFT
 
func _physics_process(delta):
	position += direction * 200 * delta
 
 
func _on__screen_exited():
	queue_free()
 
 
func _on_body_entered(body):
	if body.has_method("take_damage"):
		var attack = Attack.new()
		attack.atk_damage = 100.0
		attack.knockback_force = 100.0
		attack.source_entity = self
		attack.target_entity = body
		self.queue_free()
		body.take_damage(attack)

extends CharacterBody2D

const THROW_VELOCITY = Vector2(800, -400)
@onready var GRAVITY = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	velocity.y += GRAVITY * delta
	var collision = move_and_collide(velocity * delta)
	

func launch(direction):
	var temp = global_transform
	var scene = get_tree().current_scene
	get_parent().remove_child(self)
	scene.add_child(self)
	global_transform = temp
	velocity = THROW_VELOCITY

func _on_impact(normal: Vector2):
	velocity = velocity.bounce(normal)
	velocity *= 0.5 + randf_range(-0.05, 0.05)

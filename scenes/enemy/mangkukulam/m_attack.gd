extends CharacterBody2D

@export var SPEED = 100
var dir: float
var spawnPos: Vector2
var spawnRot: float
var target: Node2D

func _ready():
	global_position = spawnPos
	global_rotation = spawnRot
	target = get_parent().player
	
	if target:
		var direction = (target.global_position - global_position).normalized()
		dir = direction.angle()
	
func _physics_process(delta):
	velocity = Vector2(SPEED, 0).rotated(dir)
	move_and_slide()


func _on_area_2d_body_entered(body):
	if body == target:
		print("HIT")
		queue_free()

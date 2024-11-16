class_name Enemy extends CharacterBody2D

var speed := 30.0
const CHASE_SPEED : float = 200.0
const ACCELERATION : float = 300.0

@onready var sprite : Sprite2D = $FlippableSprite
@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var ray_cast : RayCast2D = $FlippableSprite/RayCast2D
@onready var timer : Timer = $Timer
@export var player : Player

@onready var state_label : Label = $Label

var jump_impulse := 170.0
var base_gravity := 300
var direction : Vector2
var left_bound : Vector2
var right_bound : Vector2

enum States {IDLE, RUNNING, JUMPING, FALLING, ATTACKING, CHASING}
var state: States = States.IDLE

func take_damage(damage : float) -> void:
	print(damage)

func _ready() -> void:
	left_bound = self.position + Vector2(-125, 0)
	right_bound = self.position + Vector2(125, 0)

func _physics_process(delta: float) -> void:
	handle_gravity(delta)
	
func handle_gravity(delta : float) -> void:
	if not is_on_floor():
		velocity.y += base_gravity * delta
	pass



func _on_timer_timeout() -> void:
	
	pass # Replace with function body.

class_name Enemy extends CharacterBody2D

var speed := 10.0 
const CHASE_SPEED : float = 50.0
const ACCELERATION : float = 300.0

@onready var sprite : Sprite2D = $FlippableSprite
@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var ray_cast : RayCast2D = $FlippableSprite/RayCast2D
@onready var timer : Timer = $ChaseTimer
@export var player : Player

@onready var state_label : Label = $Label

signal is_damaged(attack : Attack)

var jump_impulse := 170.0
var base_gravity := 500
var direction : Vector2
var left_bound : Vector2
var right_bound : Vector2

enum States {IDLE, RUNNING, JUMPING, FALLING, ATTACKING, CHASING}
var state: States = States.IDLE

func take_damage(attack : Attack) -> void:
	is_damaged.emit(attack)
	print("HINDI, wala")

func _ready() -> void:
	left_bound = self.position + Vector2(-125, 0)
	right_bound = self.position + Vector2(125, 0)

func _physics_process(delta: float) -> void:
	handle_gravity(delta)
	
func handle_gravity(delta : float) -> void:
	if not is_on_floor():
		velocity.y += base_gravity * delta
	pass

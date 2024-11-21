class_name Enemy extends CharacterBody2D

var speed := 10.0 
const CHASE_SPEED : float = 50.0
const ACCELERATION : float = 300.0

var randomSpawn
var spawned_enemies = []

var health: float 
var max_health: float
var hit_box_shape : FlippableShape

var damage : float = 100;
var knock_back_force : float = 200;
var hurt_counter : float
var current_state : String 

const MissileScene := preload("res://scenes/items/Missile.tscn")
const MagicBallScene := preload("res://scenes/magic_ball.tscn")

const Aswang := preload("res://scenes/enemy/aswang/aswang.tscn")
const Manananggal := preload("res://scenes/enemy/manananggal/mananaggal.tscn")


@onready var spawnMagicPoint : Marker2D
@onready var sprite : Sprite2D = $FlippableSprite
@onready var animation_player : AnimationPlayer
@onready var animation_tree : AnimationTree
@onready var smoke_fx : AnimationPlayer
@onready var ray_cast : RayCast2D = $FlippableSprite/RayCast2D
@onready var timer : Timer = $ChaseTimer
@export var player : Player
@onready var state_label: Label
@onready var custom_material: VisualShader = preload("res://Shaders/hit_flash.tres")


signal is_damaged(attack : Attack)
signal is_enraged()


var jump_impulse := 170.0
var base_gravity := 500
var direction : Vector2
var left_bound : Vector2
var right_bound : Vector2

enum States {IDLE, RUNNING, JUMPING, FALLING, ATTACKING, CHASING}
var state: States = States.IDLE

func take_damage(attack : Attack) -> void:
	is_damaged.emit(attack)
	hurt_counter = 0
	health -= attack.atk_damage
	var shader : ShaderMaterial = ShaderMaterial.new()
	shader.shader = custom_material
	shader.set_shader_parameter("enabled", true)
	sprite.material = shader

func _ready() -> void:
	left_bound = self.position + Vector2(-125, 0)
	right_bound = self.position + Vector2(125, 0)


func _physics_process(delta: float) -> void:
	hurt_counter += 1.0/60.0
	if hurt_counter > 0.2 and sprite.material:
		sprite.material = null
	handle_gravity(delta)
	
func handle_gravity(delta : float) -> void:
	if not is_on_floor():
		velocity.y += base_gravity * delta
	pass

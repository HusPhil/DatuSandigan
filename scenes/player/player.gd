class_name Player extends CharacterBody2D

const NAME := "DATU"

var speed := 150.0
var jump_impulse := 170.0
var base_gravity := 300

var health = 100
var max_health = 100
var min_health = 0

var moon = 100
var max_moon = 100
var min_moon = 0

var can_double_jump := true
var can_input := true
var current_direction : float = 1.0

enum States {IDLE, RUNNING, JUMPING, FALLING, ATTACKING, HURTING}
var state: States = States.IDLE


@onready var state_machine : StateMachine = get_node("StateMachine")

@onready var sprite : Sprite2D = $FlippableSprite
@onready var weapon_sprite : Sprite2D = $WeaponSprite
@onready var animation_tree : AnimationTree = $AnimationTree
@onready var weapon_animation_player : AnimationPlayer = $WeaponFX
@onready var animation_player : AnimationPlayer = $AnimationPlayer

@onready var state_label : Label = $Label
@onready var _shoot_position : Marker2D = $ShootPosition

@export var current_projectile : PackedScene
@export var current_weapon : Item

@export var camera : Camera2D

const MissileScene := preload("res://scenes/items/Missile.tscn")

signal is_hurt(attack : Attack)

func _ready() -> void:
	animation_tree.active = true
	

func _physics_process(_delta: float) -> void:
	# Horizontal movement and gravity.
	var input_direction_x := get_input_direction()
	animation_tree.set("parameters/Move/blend_position", input_direction_x)

	
func get_input_direction() -> float:
	var input_direction = Input.get_axis("move_left", "move_right")
	
	if not can_input or not input_direction:
		
		return 0.0
			
	return input_direction 

func get_current_direction() -> float:
	return -1.0 if sprite.flip_h else 1.0
	
func ready_for_input() -> void:
	can_input = true	
	pass

func take_damage(attack : Attack):
	is_hurt.emit(attack)
	pass

func handle_change_direction() -> void:
	var input_direction_x := Input.get_axis("move_left", "move_right")
	
	if input_direction_x:
		var is_flipped_direction = input_direction_x < 0
		sprite.flipped = is_flipped_direction
		weapon_sprite.flip_h = is_flipped_direction
	
func shoot() -> void:
	var missile := MissileScene.instantiate() as Projectile

	missile.drag_factor = 0.15
	missile.max_speed = 200.0
	missile.initial_direction = 180 if sprite.flip_h else 0

	missile.global_position = _shoot_position.global_position
	missile.rotation = rotation

	add_child(missile)

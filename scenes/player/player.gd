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
@onready var hit_flash_animation_player: AnimationPlayer = $"HitFlashAnimationPlayer"

@onready var state_label : Label = $Label
@onready var _shoot_position : Marker2D = $ShootPosition

@export var current_projectile : PackedScene
@export var current_weapon : Item

@export var camera : Camera2D

const MissileScene := preload("res://scenes/items/Missile.tscn")

signal is_hurt(attack : Attack)

const MAX_SAMPLES: int = 10
var record_live_index: int
var volume_samples: Array = []

@onready var mic  = $mic_input


func _ready() -> void:
	animation_tree.active = true
	#spectrum_analyzer = AudioServer.get_bus_effect_instance(record_live_index, 1)	
	record_live_index = AudioServer.get_bus_index('Record')

func _process(delta: float) -> void:
	
	var sample = db_to_linear(AudioServer.get_bus_peak_volume_left_db(record_live_index, 0))
	volume_samples.push_front(sample)

	if volume_samples.size() > MAX_SAMPLES:
		volume_samples.pop_back()

	var sample_avg = average_array(volume_samples)
	print('%sdb' % round(linear_to_db(sample_avg)))

	if volume_samples.size() > MAX_SAMPLES:
		volume_samples.pop_back()

func average_array(arr: Array) -> float:
	var avg = 0.0
	for i in range(arr.size()):
		avg += arr[i]
	avg /= arr.size()
	return avg
	



func _physics_process(_delta: float) -> void:
	# Horizontal movement and gravity.
	var input_direction_x := get_input_direction()
	animation_tree.set("parameters/Move/blend_position", input_direction_x)
	var sample_avg = average_array(volume_samples)
	var r_sample_avg = round(linear_to_db(sample_avg))
	print('%sdb' % round(linear_to_db(sample_avg)))
	
	state_label.text = str(r_sample_avg)
	
	#var magnitude = spectrum_analyzer.get_magnitude_for_frequency_range(0,200).length()
	#var energy = clamp((MIN_DB + linear_to_db(magnitude))/MIN_DB, 0, 1)
	#print("energy: ", magnitude)
	

	
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
	health -= attack.atk_damage / 100
	hit_flash_animation_player.play("hit_flash")
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
	

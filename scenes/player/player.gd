class_name Player extends CharacterBody2D

var speed := 100.0
var jump_impulse := 170.0
var base_gravity := 300

var can_double_jump := true
var can_input := true

# This enum lists all the possible states the character can be in.
enum States {IDLE, RUNNING, JUMPING, FALLING, GLIDING}

# This variable keeps track of the character's current state.
var state: States = States.IDLE

@onready var sprite : Sprite2D = $Sprite2D
@onready var weapon_sprite : Sprite2D = $WeaponSprite
@onready var animation_tree : AnimationTree = $AnimationTree
@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var weapon_animation_player : AnimationPlayer = $WeaponFX
@onready var state_label : Label = $Label
@export var current_weapon : Item

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
	
func ready_for_input() -> void:
	can_input = true	
	pass

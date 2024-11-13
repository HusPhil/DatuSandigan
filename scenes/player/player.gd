class_name Player extends CharacterBody2D

var speed := 100.0
var jump_impulse := 170.0
var base_gravity := 300
var can_input := true

# This enum lists all the possible states the character can be in.
enum States {IDLE, RUNNING, JUMPING, FALLING, GLIDING}

# This variable keeps track of the character's current state.
var state: States = States.IDLE

@onready var sprite_animation_player : AnimatedSprite2D = $sprite_animation
@onready var animation_tree : AnimationTree = $AnimationTree

func _ready() -> void:
	animation_tree.active = true
	

func _physics_process(delta: float) -> void:
	# Horizontal movement and gravity.
	var input_direction_x := get_input_direction()
	animation_tree.set("parameters/Run/blend_position", input_direction_x)
	velocity.x = input_direction_x * speed
	velocity.y += base_gravity * delta

	# Jumping.
	var is_jumping := is_on_floor() and Input.is_action_just_pressed("jump")
	if is_jumping:
		velocity.y = -jump_impulse

	# Animation.
	if not is_on_floor():
		if velocity.y < 0:
			sprite_animation_player.play("jump")
		else:
			sprite_animation_player.play("fall")
	elif input_direction_x != 0.0:
		sprite_animation_player.play("run")
	else:
		sprite_animation_player.play("idle")

	move_and_slide()
	
func get_input_direction() -> float:
	var input_direction = Input.get_axis("move_left", "move_right")
	
	if not can_input or not input_direction:
		return 0.0
	
	print("input_direction: " + str(input_direction))
	return input_direction 
	
func ready_for_input() -> void:
	can_input = true	
	pass

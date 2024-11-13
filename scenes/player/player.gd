extends CharacterBody2D

class_name  Player
enum State {
	IDLE,
	WALKING,
	FALLING,
	JUMPING
}

const SPEED = 150
const JUMP_VELOCITY = -300.0
var direction

var current_state = State.IDLE;

var sprite : AnimatedSprite2D

func _ready() -> void:
	sprite = get_node("animation")

func _input(event: InputEvent) -> void:
	print("player updating: " + str(State.find_key(current_state)))
	update_direction_state()
	pass
	
func update_direction_state():
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):  # Assuming "ui_accept" is the jump action
			current_state = State.JUMPING
			return 
		if Input.get_axis("move_left", "move_right") != 0:
			current_state = State.WALKING
		else:
			current_state = State.IDLE
	else:
		if velocity.y > 0:
			current_state = State.FALLING

func _process(delta: float) -> void:
	update_direction_state()
	#print("player updating: " + str(State.find_key(current_state)))
	
	
	match (current_state):
		State.IDLE:
			sprite.play("idle")
		State.WALKING:
			sprite.play("run")
		State.JUMPING:
			sprite.play("jump")
		State.FALLING:
			sprite.play("fall")
			

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		current_state = State.JUMPING
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_axis("move_left", "move_right")
	if direction:
		sprite.flip_h = direction < 0
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	

	

	move_and_slide()

class_name EnemyState extends State

const IDLE = "Idle"
const RUNNING = "Running"
const ATTACKING = "Jumping"

var double_jump_velocity := -100
var playback : AnimationNodeStateMachinePlayback

var jump_animation := "jump"
var fall_animation := "fall"
var run_animation := "run"
var idle_animation := "idle"
var double_jump_animation := "double_jump"
var ground_animation := "Move"

var base_atk1_animation := "base_atk1"
var base_atk2_animation := "base_atk2"
var base_atk3_animation := "base_atk3"

var fist_atk1_animation := "fist_atk1"
var fist_atk2_animation := "fist_atk2"
var fist_atk3_animation := "fist_atk3"

var sword_atk1_animation := "sword_atk1"
var sword_atk2_animation := "sword_atk2"
var sword_atk3_animation := "sword_atk3"


@export var enemy: Enemy

func _ready() -> void:
	await owner.ready
	enemy = owner as Enemy
	#playback = enemy.animation_tree["parameters/playback"]
	assert(enemy != null, "The EnemyState state type must be used only in the enemy scene. It needs the owner to be a Enemy node.")

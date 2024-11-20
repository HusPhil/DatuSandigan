class_name Projectile
extends Node2D

const LAUNCH_SPEED := 1800.0

@export var lifetime := 1.0
var max_speed := 500.0
var initial_direction := 0
@export var drag_factor: float = 0.15

var _target : CharacterBody2D
var _is_deflected : bool
var _current_velocity := Vector2.ZERO
var _attack : Attack

@onready var _sprite := $Sprite
@onready var activation_time : Timer = $ActivationtTime
@onready var _hitbox : Area2D = $HitBox
@onready var _enemy_detector : Area2D = $EnemyDetector

@onready var _aim_line := $AimLine
@onready var _target_line := $TargetLine
@onready var _change_line := $ChangeLine


func _ready():
	set_as_top_level(true)
	_aim_line.set_as_top_level(true)
	_target_line.set_as_top_level(true)
	_change_line.set_as_top_level(true)
	#_sprite.visible = false
	rotation = initial_direction 

	_hitbox.body_entered.connect(_on_HitBox_body_entered)
	# Detects a target to lock on within a large radius.
	_enemy_detector.body_entered.connect(_on_EnemyDetector_body_entered)
	
	var timer := get_tree().create_timer(lifetime)
	timer.timeout.connect(queue_free)
	activation_time.timeout.connect(_on_ActivationTime_timeout)
	activation_time.start()

	_current_velocity = max_speed  * Vector2.RIGHT.rotated(rotation) * 5

	
func _physics_process(delta: float) -> void:
	var direction := Vector2.RIGHT.rotated(rotation).normalized()
	
		
	if _target:
		direction = global_position.direction_to(_target.global_position) # Ensure direction is normalized

	var desired_velocity := direction * max_speed
	var previous_velocity = _current_velocity
	var change = (desired_velocity - _current_velocity) * drag_factor
	
	_current_velocity += change
	
	# Update position based on current velocity
	position += _current_velocity * delta
	look_at(global_position + _current_velocity)
	

	# Update the drawing of lines following the missile
	_aim_line.set_point_position(0, global_position)
	_aim_line.set_point_position(1, global_position + _current_velocity.normalized() * 150)
	_target_line.set_point_position(0, global_position)
	_target_line.set_point_position(1, global_position + direction * 150)
	_change_line.set_point_position(0, global_position + previous_velocity.normalized() * 150)	
	_change_line.set_point_position(1, global_position + _current_velocity.normalized() * 150)
	

func _on_HitBox_body_entered(_body: Node) -> void:
	if _body == _target:
		queue_free()
		
func _on_ActivationTime_timeout():
	
	pass

func _on_EnemyDetector_body_entered(enemy: Enemy):
	if _target != null:
		return
		
	if enemy == null:
		return
		
	_target = enemy

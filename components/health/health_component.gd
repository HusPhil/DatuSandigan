
class_name HealthComponent extends Node2D

@export var MAX_HEALTH : float
var health : float

func _ready() -> void:
	health = MAX_HEALTH

func damage(atk: Attack) -> void:
	health -= atk.atk_damage
	
	if health <=0:
		die()

func die():
	pass

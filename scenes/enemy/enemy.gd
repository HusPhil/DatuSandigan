class_name Enemy extends CharacterBody2D

var speed := 100.0
var jump_impulse := 170.0
var base_gravity := 300

func take_damage(damage : float) -> void:
	print(damage)

extends Enemy

func _ready() -> void:
	# redefine the values from the enemy class	
	speed = 300
	max_health = 1000
	health = max_health
	hit_box_shape = $HitBoxComponent/FlippableShape
	state_label = $Label
	#hit_box_shape.disabled = false

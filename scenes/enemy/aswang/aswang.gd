extends Enemy

func _ready() -> void:
	# redefine the values from the enemy class	
	speed = 300
	max_health = 900
	health = max_health
	animation_player = $AnimationPlayer
	smoke_fx = $SmokeFX
	hit_box_shape = $HitBoxComponent/FlippableShape
	state_label = $Label
	spawnMagicPoint = $SpawnMagic
	state_label = $Label

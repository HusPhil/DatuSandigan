extends Enemy

func _ready() -> void:
	# redefine the values from the enemy class	
	speed = 300
	max_health = 9000
	health = max_health
	animation_player = $AnimationPlayer
	smoke_fx = $SmokeFX
	hit_box_shape = $HitBoxComponent/FlippableShape
	state_label = $Label
	animation_tree = $AnimationTree
	spawnMagicPoint = $SpawnMagic
	state_label = $Label
	spawned_enemies = []

#func _process(delta: float) -> void:
	#state_label.text = str(health)

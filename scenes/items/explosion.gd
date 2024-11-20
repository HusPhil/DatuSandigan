extends Projectile

func _ready():
	drag_factor = 0.15
	_current_velocity = Vector2.ZERO
	
	_sprite = $Sprite
	activation_time = $ActivationtTime
	_hitbox = $HitBox
	_enemy_detector = $EnemyDetector

	_aim_line = $AimLine
	_target_line = $TargetLine
	_change_line = $ChangeLine
	
	_attack = Attack.new()
	_attack.knockback_force = 12
	_attack.atk_damage = 100
	

	super._ready()
	_current_velocity = max_speed  * Vector2.RIGHT.rotated(rotation) * 5
	


func _on_hit_box_body_entered(body: Node2D) -> void:
	pass # Replace with function body.

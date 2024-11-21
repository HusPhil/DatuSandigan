extends CollisionShape2D

@onready var enemy : Enemy = $"../Kapre"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready() -> void:
	pass

func _on_kapre_is_enraged() -> void:
	self.disabled = false
	pass # Replace with function body.


func _on_area_2d_body_entered(body: Node2D) -> void:
	print(body, " was detected!")
	pass # Replace with function body.


func _on_ground_attack_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		body = body as Player
		
		var atk : Attack = Attack.new()
		atk.atk_damage = 50.0;
		body.take_damage(atk)
	pass # Replace with function body.

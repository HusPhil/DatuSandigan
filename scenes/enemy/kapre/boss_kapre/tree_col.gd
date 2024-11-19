extends CollisionShape2D

@onready var enemy : Enemy = $"../Kapre"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready() -> void:
	self.disabled = true
	pass

func _on_kapre_is_enraged() -> void:
	self.disabled = false
	pass # Replace with function body.


func _on_area_2d_body_entered(body: Node2D) -> void:
	print(body, " was detected!")
	pass # Replace with function body.

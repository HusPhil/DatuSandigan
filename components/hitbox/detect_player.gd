extends Area2D
@export var flippable_sprite: FlippableSprite

func _ready():
	if flippable_sprite != null:
		for child in get_children():
			flippable_sprite.is_flipped.connect(child._on_sprite_flipped)
			

@onready var m_ball = preload("res://scenes/enemy/mangkukulam/m_attack.tscn")
func _on_body_entered(body: Node2D) -> void:
	if body == get_parent().player:
		var path = get_parent().name
		if path == "Mangkukulam":
			var k = m_ball.instantiate()
			k.dir = rotation
			k.spawnPos = global_position
			k.spawnRot = rotation
			get_parent().add_child(k)
		print("MAY PLAYER")
	pass # Replace with function body.

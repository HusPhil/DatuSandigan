extends Area2D

@onready var explosion: CPUParticles2D = $explosion
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var powerup_sfx: AudioStreamPlayer2D = $powerup_sfx


func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		# Hide the AnimatedSprite2D
		animated_sprite_2d.hide()
		powerup_sfx.play()
		
		# Ensure the particles emit only once
		explosion.one_shot = true
		explosion.emitting = true  # Start the particle effect
		
		# Wait until the particle system has finished emitting
		await explosion.finished
		
		# Free the item after the particle effect is complete
		queue_free()

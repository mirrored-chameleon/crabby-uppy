extends RigidBody2D

@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D


func _process(delta: float) -> void:
	for body in get_colliding_bodies():
		if body is CharacterBody2D:
			physics_material_override.bounce = 0.0
			linear_velocity += Vector2(randf_range(-150.0, 150.0), randf_range(-150.0, 150.0))
			print("HIT")
			audio_stream_player_2d.play()

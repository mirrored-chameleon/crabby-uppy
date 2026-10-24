extends RigidBody2D

@onready var audio_stream_player_2d: AudioStreamPlayer2D = $Hit
@onready var popped: AudioStreamPlayer2D = $Popped


func _process(delta: float) -> void:
	for body in get_colliding_bodies():
		if body is CharacterBody2D:
			physics_material_override.bounce = 0.0
			linear_velocity += Vector2(randf_range(-150.0, 150.0), randf_range(-150.0, 150.0))
			print("HIT")
			audio_stream_player_2d.play()
		gravity_scale = 1 + (Global.score * 0.1)
		
		physics_material_override.bounce = 0.5


func _on_popzone_body_entered(body: Node2D) -> void:
	print("POPPED")
	popped.play()
	await get_tree().create_timer(2.0).timeout
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

extends Sprite2D

@onready var ball: RigidBody2D = $"../Ball"

@export var SCREEN_MARGIN_TOP = 55.0

const SPRITE_ANGLE_OFFSET_DEGREES = 90.0

func _process(_delta: float) -> void:
	var viewport_rect = get_viewport_rect()
	var ball_screen_pos = ball.get_global_transform_with_canvas().origin
	
	var is_off_screen = not viewport_rect.has_point(ball_screen_pos)
	
	if is_off_screen:
		visible = true
		
		var canvas_transform = get_viewport().get_canvas_transform()
		var camera_pos = -canvas_transform.origin / canvas_transform.get_scale()
		var camera_size = viewport_rect.size / canvas_transform.get_scale()
		
		var target_x = clamp(
			ball.global_position.x, 
			camera_pos.x + 32.0, 
			camera_pos.x + camera_size.x - 32.0
		)
		var target_y = camera_pos.y + (SCREEN_MARGIN_TOP / canvas_transform.get_scale().y)
		
		global_position = Vector2(target_x, target_y)
		
		var angle_to_target = global_position.angle_to_point(ball.global_position)
		rotation = angle_to_target + deg_to_rad(SPRITE_ANGLE_OFFSET_DEGREES)
		
	else:
		visible = false

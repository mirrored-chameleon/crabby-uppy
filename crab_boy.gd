extends CharacterBody2D

@onready var sprite: Sprite2D = $Sprite2D

@export_group("Movement Stats")
@export var speed: float = 600.0
@export var jump_velocity: float = -1500.0
@export var acceleration: float = 0.5

var jump_count: int = 0
const max_jumps: int = 1

func get_grav(checked_velocity: float) -> float:
	if checked_velocity < 0:
		return 5000.0
	else:
		return 7150.0

func _physics_process(delta: float) -> void:
	if is_on_floor():
		jump_count = 0

	velocity.y += get_grav(velocity.y) * delta
	
	# Variable Jump Height (Release early to cut jump short)
	if Input.is_action_just_released("ui_up") and velocity.y < 0:
		velocity.y *= 0.5
		
	# Normal Jump Execution
	if Input.is_action_just_pressed("ui_up") and jump_count < max_jumps:
		velocity.y = jump_velocity
		jump_count += 1

	if Input.is_action_pressed("ui_right"):
		velocity.x = lerp(velocity.x, speed, acceleration)
		sprite.flip_h = true
	elif Input.is_action_pressed("ui_left"):
		velocity.x = lerp(velocity.x, -speed, acceleration)
		sprite.flip_h = false
	elif is_on_floor():
		velocity.x = lerp(velocity.x, 0.0, acceleration)
	else:
		velocity.x = lerp(velocity.x, 0.0, 0.01)

	move_and_slide()



func _on_score_checker_body_entered(body: Node2D) -> void:
	Global.score += 1
	print(Global.score)

extends CharacterBody2D

const ACCELERATION = 70
const MAX_SPEED = 100
const FRICTION = 10000

var speed = Vector2.ZERO

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	if input_vector != Vector2.ZERO:
		speed += input_vector.normalized() * ACCELERATION * delta
		speed = speed.limit_length(MAX_SPEED * delta)
	else:
		speed = speed.move_toward(Vector2.ZERO, FRICTION * delta)
	
	move_and_collide(speed)

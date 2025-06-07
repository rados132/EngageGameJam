extends CharacterBody2D

const ACCELERATION = 70
const MAX_SPEED = 100
const FRICTION = 10000
const MAX_HEALTH = 100

var attack_cooldown = 1.0 # in seconds
var damage = 5

var speed = Vector2.ZERO
var health: float = MAX_HEALTH
var can_attack = true
var enemies_in_range = []

func _ready():
	update_progress_bar()
	$AttackArea.body_entered.connect(_on_attack_area_body_entered)
	$AttackArea.body_exited.connect(_on_attack_area_body_exited)

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

	# Attack on Space press
	if Input.is_action_just_pressed("attack") and can_attack:
		attack()

func attack():
	can_attack = false
	for enemy in enemies_in_range:
		if enemy.has_method("take_damage"):
			enemy.take_damage(damage)
	# Start cooldown timer
	var timer = Timer.new()
	timer.one_shot = true
	timer.wait_time = attack_cooldown
	add_child(timer)
	timer.connect("timeout", Callable(self, "_on_attack_cooldown_timeout"))
	timer.start()

func _on_attack_cooldown_timeout():
	can_attack = true

func _on_attack_area_body_entered(body):
	if body.is_in_group("enemies"):
		enemies_in_range.append(body)

func _on_attack_area_body_exited(body):
	if body.is_in_group("enemies"):
		enemies_in_range.erase(body)

func take_damage(amount):
	health -= amount
	update_progress_bar()
	print("Savin health:", health)
	if health <= 0:
		die()

func die():
	print("Sava je umro!")
	# Add your death logic here (e.g., respawn, game over, etc.)


func update_progress_bar():
	$ProgressBar.value = health / MAX_HEALTH * 100

extends CharacterBody2D
@onready var target = $"../../CharacterBody2D"
@onready var agent = $NavigationAgent2D
@onready var animated_sprite_2d = $AnimatedSprite2D
const speed = 40
const attack_cooldown = 1.0 # u sekundama
const damage = 10
var player_in_area = false


func _ready():
	var timer = Timer.new()
	timer.one_shot = false # Repeat attacks
	timer.wait_time = attack_cooldown
	timer.name = "AttackCooldownTimer"
	add_child(timer)
	timer.connect("timeout", Callable(self, "_on_attack_cooldown_timeout"))
	
	$AttackArea.body_entered.connect(_on_attack_area_body_entered)
	$AttackArea.body_exited.connect(_on_attack_area_body_exited)
	
	agent.target_position = target.global_position


func _physics_process(delta: float) -> void:
	navigation()
	navigate(delta)

	# agent.target_position = target.global_position

	# if agent.is_navigation_finished():
	# 	velocity = Vector2.ZERO
	# else:
	# 	var next_point = agent.get_next_path_position()
	# 	var direction = (next_point - global_position)
	# 	direction = direction.normalized()  
	# 	if direction.length() > 0.1:
	# 		velocity = direction.normalized() * speed
	# 		# Optionally: look_at(global_position + direction)
	# 	else:
	# 		velocity = Vector2.ZERO

	# move_and_slide()


func navigation() -> void:
	agent.target_position = target.global_position


func navigate(delta: float) -> void:
	if agent.is_navigation_finished():
		return
	var next_point: Vector2 = agent.get_next_path_position()
	var new_velocity: Vector2 = (
		global_position.direction_to(next_point) * speed
	)
	position += new_velocity * delta


func _on_attack_area_body_entered(body):
	if body.name == "Main_Character":
		player_in_area = true
		$AttackCooldownTimer.start()
		attack() # Immediate attack on entry


func _on_attack_area_body_exited(body):
	if body.name == "Main_Character":
		player_in_area = false
		$AttackCooldownTimer.stop()
		animated_sprite_2d.animation = "default"


func _on_attack_cooldown_timeout():
	if player_in_area:
		attack()


func attack():
	if target and target.has_method("take_damage"):
		target.take_damage(damage)
		animated_sprite_2d.animation = "napad"
	print("Napad!")  # Zamijeni kasnije sa nanosenjem stete

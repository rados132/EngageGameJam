extends CharacterBody2D
@onready var target = $"../../Main_Character"
@onready var agent = $NavigationAgent2D
const speed = 50
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

func _physics_process(_delta: float) -> void:
	agent.target_position = target.global_position

	if agent.is_navigation_finished():
		velocity = Vector2.ZERO
	else:
		var next_path_point = agent.get_next_path_position()
		var distance = global_position.distance_to(next_path_point)
		if distance > 2.0: # Only move if not already at the point
			var direction = (next_path_point - global_position).normalized()
			velocity = direction * speed
			look_at(next_path_point)
		else:
			velocity = Vector2.ZERO

	move_and_slide()

func _on_attack_area_body_entered(body):
	if body.name == "Main_Character":
		player_in_area = true
		$AttackCooldownTimer.start()
		attack() # Immediate attack on entry

func _on_attack_area_body_exited(body):
	if body.name == "Main_Character":
		player_in_area = false
		$AttackCooldownTimer.stop()

func _on_attack_cooldown_timeout():
	if player_in_area:
		attack()

func attack():
	if target and target.has_method("take_damage"):
		target.take_damage(damage)
	print("Napad!")  # Zamijeni kasnije sa nanosenjem stete

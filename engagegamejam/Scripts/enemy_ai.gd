extends CharacterBody2D
@onready var target = $"../Main_Character"
var speed = 100
var attack_cooldown = 1.0 # u sekundama
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

func _physics_process(_delta: float) -> void:
	var direction = (target.position - position).normalized()
	velocity = direction * speed
	look_at(target.position)
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
	print("Napad!")  # Zamijeni kasnije sa nanosenjem stete

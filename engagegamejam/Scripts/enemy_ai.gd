extends CharacterBody2D
@onready var target = $"../Main_Character"
var speed = 100
var attack_range = 20.0
var attack_cooldown = 1.0 # u sekundama
var can_attack = true


func _physics_process(_delta: float) -> void:
	# Move towards the target
	var direction = (target.position - position).normalized()
	velocity = direction * speed
	# Move the character
	look_at(target.position)
	move_and_slide()


# Called when the node enters the scene tree for the first time.
func _ready():
	var timer = Timer.new()
	timer.one_shot = true
	timer.wait_time = attack_cooldown
	timer.name = "AttackCooldownTimer"
	add_child(timer)
	timer.connect("timeout", Callable(self, "_on_attack_cooldown_timeout"))


func attack():
	can_attack = false
	print("Napad!")  # Zamijeni kasnije sa nanosenjem stete
	$AttackCooldownTimer.start()


func _on_attack_cooldown_timeout():
	can_attack = true


# # Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta: float) -> void:
# 	pass

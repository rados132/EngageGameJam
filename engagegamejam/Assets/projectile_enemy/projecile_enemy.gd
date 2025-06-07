extends Node2D
var bullet_path = preload("res://Assets/projectile_enemy/projektil.tscn")


func _physics_process(_delta: float) -> void:
	look_at(get_global_mouse_position())


func _ready():
	var timer = Timer.new()
	timer.wait_time = 1.0
	timer.one_shot = false
	timer.autostart = true
	add_child(timer)
	timer.connect("timeout", Callable(self, "fire"))


func fire():
	var bullet = bullet_path.instantiate()
	bullet.direction = rotation
	bullet.pos = $CharacterBody2D/Node2D.global_position
	bullet.rota = global_rotation
	get_parent().add_child(bullet)

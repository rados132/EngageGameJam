extends CharacterBody2D
var pos: Vector2
var rota: float
var speed: float = 200.0
var direction: float


func _ready() -> void:
	global_position = pos
	global_rotation = rota


func _physics_process(delta: float) -> void:
	velocity = Vector2(speed, 0).rotated(direction)	
	move_and_slide()

extends CharacterBody2D

@export var speed: float = 150.0
@export var track_start_x: float = 5200
@export var track_end_x: float = 5360.0
@export var track_y: float = 80

var current_target_x: float

func _ready():
	global_position.x = track_start_x
	global_position.y = track_y
	current_target_x = track_end_x
	print("Bus starting journey from ", track_start_x, " to ", track_end_x)

func _physics_process(delta: float) -> void:
	velocity.x = speed
	velocity.y = 0
	move_and_slide()

extends CharacterBody2D

@export var speed: float = 150.0
@export var track_start_x: float = 5200
@export var track_end_x: float = 5360.0
@export var track_y: float = 80
var assigned_track_y: float = 0

@onready var audio_player = $AudioStreamPlayer2D

var current_target_x: float

func _ready():
	assigned_track_y = global_position.y
	
	print("Bus starting journey from ", global_position)

func _physics_process(delta: float) -> void:
	velocity.x = speed
	velocity.y = 0
	move_and_slide()
	
	global_position.y = assigned_track_y

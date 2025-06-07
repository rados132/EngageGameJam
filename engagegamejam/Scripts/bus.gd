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
	
	if audio_player:
		audio_player.autoplay = true
		audio_player.volume_db = 20.0 
		audio_player.play()

	print("Bus starting journey from ", global_position)

func _physics_process(delta: float) -> void:
	velocity.x = speed
	velocity.y = 0
	move_and_collide(velocity)
	
	global_position.y = assigned_track_y

func set_track_bounds(start_x: float, end_x: float, track_y: float = 0.0):
	track_start_x = start_x
	track_end_x = end_x
	if track_y != 0.0:
		assigned_track_y = track_y  # Store the assigned track Yawawdwaawdadwa

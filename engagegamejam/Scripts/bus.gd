extends CharacterBody2D

@export var speed: float = 150.0
@export var track_start_x: float = 5200
@export var track_end_x: float = 5360.0
@export var track_y: float = 80
var assigned_track_y: float = 0
var current_target_x: float

@onready var damage_area = $DamageZone	

func _ready():
	assigned_track_y = global_position.y
	
	if damage_area:
		damage_area.body_entered.connect(_on_damage_zone_body_entered)
		print("Damage zone signal connected")
	else:
		print("ERROR: DamageZone not found!")
	
	print("Bus starting journey from ", global_position)

func _physics_process(delta: float) -> void:
	velocity.x = speed
	velocity.y = 0
	move_and_slide()
	
	global_position.y = assigned_track_y

func hit_player(player):
	print("bus hit player")
	
	if player.has_method("take_damage"):
		player.take_damage(999)


func _on_damage_zone_body_entered(body) -> void:
	if body.name == "Main_Character": 
		hit_player(body)
	

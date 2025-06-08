extends Area2D

@export var is_on: bool = false
signal switched(on: bool)

var player_inside: bool = false

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body: Node) -> void:
	if body.name == "CharacterBody2D":
		player_inside = true

func _on_body_exited(body: Node) -> void:
	if body.name == "CharacterBody2D":
		player_inside = false

func _process(delta: float) -> void:
	if player_inside and Input.is_action_just_pressed("switch_activation"):
		print("ovo kao radi")
		toggle()

func toggle() -> void:
	is_on = !is_on
	switched.emit(is_on)
   

extends Node

@onready var character_menu = $Main_Character/Camera2D2/CharacterPage
var paused = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("open_inventory"):
		character_screen()

func character_screen() -> void:
	if paused:
		character_menu.hide();
		Engine.time_scale = 1
	else:
		character_menu.show()
		Engine.time_scale = 0
	
	paused = !paused

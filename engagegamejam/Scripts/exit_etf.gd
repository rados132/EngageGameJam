extends Area2D

@onready var sprite = $Sprite2D

func _ready():
	if sprite:
		sprite.modulate = Color(1.3, 1.1, 0.4, 1.0)
		var tween = create_tween()
		tween.set_loops()
		tween.tween_property(sprite, "modulate:a", 0.7, 1.0)
		tween.tween_property(sprite, "modulate:a", 1.0, 1.0)



func _on_body_entered(body: Node2D) -> void:
	if body.name == "Main_Character":
		print("Player entered, switching scene")
		SceneTransition.fade_to_scene("res://Scenes/kalu-bulevar.tscn")

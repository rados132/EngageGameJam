extends Area2D

@onready var tree_sprite := $"../Sprite2D"

func _ready():
	connect("body_entered", _on_body_entered)
	connect("body_exited", _on_body_exited)

func _on_body_entered(body):
	if body.name == "CharacterBody2D":
		tree_sprite.modulate.a = 0.4  # učini drvo providnim

func _on_body_exited(body):
	if body.name == "CharacterBody2D":
		tree_sprite.modulate.a = 1.0  # vrati na puno vidljivo

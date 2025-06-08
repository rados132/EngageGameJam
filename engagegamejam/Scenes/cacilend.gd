extends Node


@export var tilemap1: Node2D
@export var tilemap2: Node2D

var selected: int = 1


func _ready():
	switch()
	for i in 5:
		print("switch")
		await get_tree().create_timer(3.0).timeout
		switch()



func switch():
	selected = 1-selected
	if selected == 1:
		for layer: TileMapLayer in tilemap1.get_children():
			layer.visible = true
			layer.collision_enabled = true
		for layer: TileMapLayer in tilemap2.get_children():
			layer.visible = false
			layer.collision_enabled = false
	else:
		for layer: TileMapLayer in tilemap1.get_children():
			layer.visible = false
			layer.collision_enabled = false
		for layer: TileMapLayer in tilemap2.get_children():
			layer.visible = true
			layer.collision_enabled = true

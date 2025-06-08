extends Node


@export var tilemap1: Node2D
@export var tilemap2: Node2D
@export var drveta: Node2D
@export var satori: Node2D



var selected: int = 1


func _ready():

	var doShit: bool  = false
	for layer: TileMapLayer in tilemap2.get_children():
			layer.visible = false
			layer.collision_enabled = false
	
	if(doShit):
		for i in 5:
			print("switch")
			await get_tree().create_timer(10.0).timeout
			switch()
	
		


#ruzan kod jebiga, mrzi me bolje trenutno a i nemam mozga
func switch():
	selected = 1-selected
	if selected == 1:
		for layer: TileMapLayer in tilemap1.get_children():
			layer.visible = true
			layer.collision_enabled = true
		
		for layer: TileMapLayer in tilemap2.get_children():
			layer.visible = false
			layer.collision_enabled = false
			
		for drvo: StaticBody2D in drveta.get_children():
			drvo.visible = true	
			drvo.collision_layer = true
			drvo.collision_mask = true
			
		for sator: StaticBody2D in satori.get_children():
			sator.visible = true	
			sator.collision_layer = true
			sator.collision_mask = true
	else:
		for layer: TileMapLayer in tilemap1.get_children():
			layer.visible = false
			layer.collision_enabled = false
			
		for layer: TileMapLayer in tilemap2.get_children():
			layer.visible = true
			layer.collision_enabled = true
			
		for drvo: StaticBody2D in drveta.get_children():
			drvo.visible = false	
			drvo.collision_layer = false
			drvo.collision_mask = false
			
		for sator: StaticBody2D in satori.get_children():
			sator.visible = false	
			sator.collision_layer = false
			sator.collision_mask = false

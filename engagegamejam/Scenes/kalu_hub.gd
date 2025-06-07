extends Node


@export var nav1: NavigationPolygon
@export var nav2: NavigationPolygon

@export var nav_region: NavigationRegion2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func switch():
	nav_region.navigation_polygon = nav1

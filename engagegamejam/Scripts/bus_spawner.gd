extends Node

@export var bus_scene: PackedScene  # Drag your Bus.tscn here in editor
@export var spawn_interval: float = 2.0  
@export var bus_distance: float = 1000.0  
@export var track_start_x: float = 4000.0 
@export var track_end_x: float = 5600.0
@export var track_y: Array[float] = [120, 24, -68]

@onready var audio_player = $AudioStreamPlayer2D

var spawn_timer: Timer
var buses: Array[Node] = []

func _ready() -> void:
	spawn_timer = Timer.new()
	spawn_timer.wait_time = spawn_interval
	spawn_timer.one_shot = false
	spawn_timer.timeout.connect(_spawn_bus)
	add_child(spawn_timer)
	spawn_timer.start()
	
	_spawn_bus()

func _spawn_bus():
	var new_bus = bus_scene.instantiate()	
	
	var random_y = track_y.pick_random()
	new_bus.position = Vector2(track_start_x, random_y)
	
	if new_bus.has_method("set_track_bounds"):
		new_bus.set_track_bounds(track_start_x, track_end_x, random_y)
	
	get_parent().add_child(new_bus)
	buses.append(new_bus)
	
	new_bus.connect("tree_exited", _on_bus_removed.bind(new_bus))
	
	print("Bus spawned at: ", new_bus.position)

func _on_bus_removed(bus):
	if bus in buses:
		buses.erase(bus)

func _process(delta: float) -> void:
	for bus in buses:
		if is_instance_valid(bus) and bus.global_position.x > track_end_x + 200:
			bus.queue_free()

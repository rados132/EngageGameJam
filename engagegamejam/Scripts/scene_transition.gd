extends CanvasLayer

@onready var color_rect = $ColorRect

func _ready():
	color_rect.color = Color.BLACK
	color_rect.mouse_filter = Control.MOUSE_FILTER_IGNORE
	
	color_rect.modulate.a = 0.0

func fade_to_scene(scene_path: String):
	var tween = create_tween()
	tween.tween_property(color_rect, "modulate:a", 1.0, 0.5)
	await tween.finished
	
	get_tree().change_scene_to_file(scene_path)
	
	await get_tree().process_frame
	var fade_in_tween = create_tween()
	fade_in_tween.tween_property(color_rect, "modulate:a", 0.0, 0.5)

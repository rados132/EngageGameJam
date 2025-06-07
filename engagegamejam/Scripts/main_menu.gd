extends Control




func _on_start_button_pressed() -> void:
	SceneTransition.fade_to_scene("res://Scenes/kalu-hub.tscn")


func _on_options_button_pressed() -> void:
	pass # Replace with function body.


func _on_exit_button_pressed() -> void:
	get_tree().quit();

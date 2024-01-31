extends CanvasLayer

signal restart

func _on_restart_button_pressed():
	restart.emit() # Replace with function body.


func _on_back_button_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/navigation.tscn") # Replace with function body.

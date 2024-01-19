extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	get_window().size = Vector2i(2000, 1600)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/navigation.tscn") # Replace with function body.

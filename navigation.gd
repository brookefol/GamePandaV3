extends Control

var value
var button

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_to_connect_four_pressed():
	get_tree().change_scene_to_file("res://Scenes/connect_four.tscn")

extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	get_window().size = Vector2i(2400, 1600)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_to_connect_four_pressed():
	get_tree().change_scene_to_file("res://Scenes/connect_four.tscn")


func _on_to_pong_pressed():
	get_tree().change_scene_to_file("res://Scenes/Pong/Board/Board.tscn") # Replace with function body.


func _on_to_archery_pressed():
	get_tree().change_scene_to_file("res://Scenes/archery.tscn")



func _on_to_tic_tac_toe_pressed():
	get_tree().change_scene_to_file("res://tictactoe.tscn")


func _on_to_crossy_road_pressed():
	get_tree().change_scene_to_file("res://Scenes/crossyRoad.tscn")

extends Control

var speed = 20 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_xMovement()
	pass


func _xMovement():
	var target = $marker
	target.position.x+= speed;
	if (target.position.x >= 1370):
		speed = -20;
		target.position.y += 50
	if (target.position.x<= 540):
		speed = 20
		target.position.y += 50

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/navigation.tscn")
	pass # Replace with function body.

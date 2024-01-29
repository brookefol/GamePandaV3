extends Control

var pandaCars = []
var start = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	get_window().size = Vector2i(2400, 1600)
	var pandas = get_tree().get_nodes_in_group("pandaCars");
	for panda in pandas:
		pandaCars.append(panda);
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var instructions = $Instructions
	var playerOne = $Player1
	var playerTwo = $Player2
	if (Input.is_key_pressed(KEY_ENTER)):
		instructions.visible = false;
		start = true
	if (start== true):
		_carMovement();
		_playerOneMovement();
		_playerTwoMovement();
	if (playerOne.position.y <= 5):
		var win = $PlayerOneWins
		win.visible = true
		start = false
	if (playerTwo.position.y <= 5):
		var win = $PlayerTwoWins
		win.visible = true
		start = false
	pass

func _carMovement():
	for panda in pandaCars:
		panda.position.x += 20;
		if (panda.position.x>=2400):
			panda.position.x= 0

func _playerOneMovement():
	var playerOne = $Player1
	if Input.is_action_pressed("ui_up"):
		playerOne.position.y-=10;
	if Input.is_action_pressed("ui_down"):
		playerOne.position.y+=10;
	for panda in pandaCars:
		if playerOne.position.x >= (panda.position.x-95) and playerOne.position.x<=(panda.position.x+95) and abs((panda.position.y-playerOne.position.y))<=85:
			playerOne.position.y=1500
	
func _playerTwoMovement():
	var playerTwo = $Player2
	if Input.is_key_pressed(KEY_C):
		playerTwo.position.y-=10;
	if Input.is_key_pressed(KEY_B):
		playerTwo.position.y+=10;
	for panda in pandaCars:
		if playerTwo.position.x >= (panda.position.x-95) and playerTwo.position.x<=(panda.position.x+95) and abs((panda.position.y-playerTwo.position.y))<=85:
			playerTwo.position.y=1500
		
	
	


func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/navigation.tscn")
	pass # Replace with function body.

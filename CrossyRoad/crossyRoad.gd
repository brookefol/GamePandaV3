extends Control

var pandaCars = []

# Called when the node enters the scene tree for the first time.
func _ready():
	get_window().size = Vector2i(2400, 1600)
	var pandas = get_tree().get_nodes_in_group("pandaCars");
	for panda in pandas:
		pandaCars.append(panda);
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_carMovement();
	_playerOneMovement();
	_playerTwoMovement();
	pass

func _carMovement():
	for panda in pandaCars:
		panda.position.x += 15;
		if (panda.position.x>=2400):
			panda.position.x= 0

func _playerOneMovement():
	var playerOne = $Player1
	if Input.is_action_pressed("ui_up"):
		playerOne.position.y-=10;
	if Input.is_action_pressed("ui_down"):
		playerOne.position.y+=10;
	
func _playerTwoMovement():
	var playerTwo = $Player2
	if Input.is_key_pressed(KEY_C):
		playerTwo.position.y-=10;
	if Input.is_key_pressed(KEY_B):
		playerTwo.position.y+=10;
	

extends Control

var board = [
		[null, null, null, null, null, null, null, null], 
		[null, null, null, null, null, null, null, null], 
		[null, null, null, null, null, null, null, null], 
		[null, null, null, null, null, null, null, null],
		[null, null, null, null, null, null, null, null],
		[null, null, null, null, null, null, null, null]
		]
var playerTurn = 0
var playerSymbol = ["X", "O"]

# Called when the node enters the scene tree for the first time.
func _ready():
	get_window().size = Vector2i(2400, 1600)
	_setChipsOff()

func _setChipsOff():
	for i in range(6):
		for j in range(8):
			var value = str(i) + str(j)
			var button = get_node("GridContainer/"+value)
			if button:
				button.disabled = not button.disabled
	for i in range(6):
		for j in range(8):
			var value = str(i) + str(j)
			var button = get_node("GridContainer2/"+value)
			if button:
				button.disabled = not button.disabled
	var player1Win = get_node("Player1Win")
	var player2Win = get_node("Player2Win")
	var backHome = get_node("BackHome")
	var restart = get_node("Restart")
	
	print(player1Win)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _displayWin():
	if (playerTurn%2 == 0):
		var winBoard = get_node("Player1Win")
		winBoard.visible = true
	if (playerTurn%2 == 1):
		var winBoard = get_node("Player2Win")
		winBoard.visible = true
	var backHome = get_node("BackHome")
	var restart = get_node("Restart")
	
	backHome.visible = true
	restart.visible = true
		


func _winCheck():
	print(board[5], "\n", board[4], "\n", board[3], "\n",  board[2], "\n", board[1], "\n", board[0])
	# horizontal
	for i in range(6):
		for j in range(5):
			if board[i][j] == playerSymbol[(playerTurn+1)%2] and board[i][j] == board[i][j+1] and board[i][j+1] == board[i][j+2] and board[i][j+2] == board[i][j+3]:
				_displayWin();
				break
	# verticle
	for i in range(8):
		for j in range(3):
			if board[j][i] == playerSymbol[(playerTurn+1)%2] and board[j][i] == board[j+1][i] and board[j+1][i] == board[j+2][i] and board[j+2][i] == board[j+3][i]:
				_displayWin();
				break
	# slants
	for i in range(5):
		for j in range(3):
			if board[j][i] == playerSymbol[(playerTurn+1)%2] and board[j][i] == board[j+1][i+1] and board[j+1][i+1] == board[j+2][i+2] and board[j+2][i+2] == board[j+3][i+3]:
				_displayWin();
				break
			if board[j+3][i] == playerSymbol[(playerTurn+1)%2] and board[j+3][i] == board[j+2][i+1] and board[j+2][i+1] == board[j+1][i+2] and board[j+1][i+2] == board[j][i+3]:
				_displayWin();
				break


func _dropChip(column):
	for i in range(6):
		if board[i][column] == null:
			var value = str(5-i) + str(column)
			if playerTurn % 2 == 0:
				var button = get_node("GridContainer/"+value)
				if button:
					button.disabled = false
			else:
				var button = get_node("GridContainer2/"+value)
				if button:
					button.disabled = false
			board[i][column] = playerSymbol[playerTurn%2]
			break
	playerTurn += 1
	_winCheck()

func _on_texture_pressed():
	get_tree().change_scene_to_file("res://Scenes/navigation.tscn")
	
func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://navigation.tscn") # Replace with function body.

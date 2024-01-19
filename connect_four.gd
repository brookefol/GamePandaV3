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

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _winCheck():
	print(board[5], "\n", board[4], "\n", board[3], "\n",  board[2], "\n", board[1], "\n", board[0])
	# horizontal
	for i in range(6):
		for j in range(5):
			if board[i][j] == playerSymbol[(playerTurn+1)%2] and board[i][j] == board[i][j+1] and board[i][j+1] == board[i][j+2] and board[i][j+2] == board[i][j+3]:
				var tempWin = get_node("tempWin")
				tempWin.visible = true
				break
	# verticle
	for i in range(8):
		for j in range(3):
			if board[j][i] == playerSymbol[(playerTurn+1)%2] and board[j][i] == board[j+1][i] and board[j+1][i] == board[j+2][i] and board[j+2][i] == board[j+3][i]:
				var tempWin = get_node("tempWin")
				tempWin.visible = true
				break
	# slants
	for i in range(5):
		for j in range(3):
			if board[j][i] == playerSymbol[(playerTurn+1)%2] and board[j][i] == board[j+1][i+1] and board[j+1][i+1] == board[j+2][i+2] and board[j+2][i+2] == board[j+3][i+3]:
				var tempWin = get_node("tempWin")
				tempWin.visible = true
				break
			if board[j+3][i] == playerSymbol[(playerTurn+1)%2] and board[j+3][i] == board[j+2][i+1] and board[j+2][i+1] == board[j+1][i+2] and board[j+1][i+2] == board[j][i+3]:
				var tempWin = get_node("tempWin")
				tempWin.visible = true
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


func _column6_add():
	_dropChip(6)


func _column7_add():
	_dropChip(7)


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://navigation.tscn") # Replace with function body.

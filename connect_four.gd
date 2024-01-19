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


func _column0_add():
	for i in range(6):
		if board[5-i][0] == null:
			var value = str(5-i) + str(0)
			if playerTurn % 2 == 0:
				var button = get_node("GridContainer/"+value)
				if button:
					button.disabled = false
			else:
				var button = get_node("GridContainer2/"+value)
				board[5-i][0] = playerSymbol[playerTurn%2]
				if button:
					button.disabled = false
			break
	playerTurn += 1


func _column1_add():
	for i in range(6):
		if board[5-i][1] == null:
			var value = str(5-i) + str(1)
			if playerTurn % 2 == 0:
				var button = get_node("GridContainer/"+value)
				if button:
					button.disabled = false
			else:
				var button = get_node("GridContainer2/"+value)
				if button:
					button.disabled = false
			board[5-i][1] = playerSymbol[playerTurn%2]
			break
	playerTurn += 1


func _column2_add():
	for i in range(6):
		if board[5-i][2] == null:
			var value = str(5-i) + str(2)
			if playerTurn % 2 == 0:
				var button = get_node("GridContainer/"+value)
				if button:
					button.disabled = false
			else:
				var button = get_node("GridContainer2/"+value)
				if button:
					button.disabled = false
			board[5-i][2] = playerSymbol[playerTurn%2]
			break
	playerTurn += 1


func _column3_add():
	for i in range(6):
		if board[5-i][3] == null:
			var value = str(5-i) + str(3)
			if playerTurn % 2 == 0:
				var button = get_node("GridContainer/"+value)
				if button:
					button.disabled = false
			else:
				var button = get_node("GridContainer2/"+value)
				if button:
					button.disabled = false
			board[5-i][3] = playerSymbol[playerTurn%2]
			break
	playerTurn += 1


func _column4_add():
	for i in range(6):
		if board[5-i][4] == null:
			var value = str(5-i) + str(4)
			if playerTurn % 2 == 0:
				var button = get_node("GridContainer/"+value)
				if button:
					button.disabled = false
			else:
				var button = get_node("GridContainer2/"+value)
				if button:
					button.disabled = false
			board[5-i][4] = playerSymbol[playerTurn%2]
			break
	playerTurn += 1


func _column5_add():
	for i in range(6):
		if board[5-i][5] == null:
			var value = str(5-i) + str(5)
			if playerTurn % 2 == 0:
				var button = get_node("GridContainer/"+value)
				if button:
					button.disabled = false
			else:
				var button = get_node("GridContainer2/"+value)
				if button:
					button.disabled = false
			board[5-i][5] = playerSymbol[playerTurn%2]
			break
	playerTurn += 1


func _column6_add():
	for i in range(6):
		if board[5-i][6] == null:
			var value = str(5-i) + str(6)
			if playerTurn % 2 == 0:
				var button = get_node("GridContainer/"+value)
				if button:
					button.disabled = false
			else:
				var button = get_node("GridContainer2/"+value)
				if button:
					button.disabled = false
			board[5-i][6] = playerSymbol[playerTurn%2]
			break
	playerTurn += 1


func _column7_add():
	for i in range(6):
		if board[5-i][7] == null:
			var value = str(5-i) + str(7)
			if playerTurn % 2 == 0:
				var button = get_node("GridContainer/"+value)
				if button:
					button.disabled = false
			else:
				var button = get_node("GridContainer2/"+value)
				if button:
					button.disabled = false
			board[5-i][7] = playerSymbol[playerTurn%2]
			break
	playerTurn += 1


func _on_column_5_pressed():
	pass # Replace with function body.


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://navigation.tscn") # Replace with function body.

extends Control

var board = [
	[null, null, null, null, null, null, null, null], 
	[null, null, null, null, null, null, null, null], 
	[null, null, null, null, null, null, null, null], 
	[null, null, null, null, null, null, null, null], 
	[null, null, null, null, null, null, null, null], 
	[null, null, null, null, null, null, null, null]]

var playerTurn = 0
var playerSymbol = ["X", "O"]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # each list is a column

func _setChipsOff():
	for i in range(6):
		for j in range(8):
			var value = str(i) + str(j)
			var button = get_node("GridContainer/"+value)
			if button:
				button.disabled = not button.disabled

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _column0Add():
	for i in range(6):
		if board[5-i][0] == null:
			var value = str(5-i) + str(0)
			var button = get_node("GridContainer/"+value)
			if button:
				button.disabled = false
				board[5-i][0] = playerSymbol[playerTurn%2]
				if playerTurn % 2 == 1:
					pass
			break
	playerTurn += 1


func _column1Add():
	for i in range(6):
		if board[5-i][1] == null:
			var value = str(5-i) + str(1)
			var button = get_node("GridContainer/"+value)
			if button:
				button.disabled = false
				board[5-i][1] = playerSymbol[playerTurn%2]
				if playerTurn % 2 == 1:
					pass
			break
	playerTurn += 1

func _column2Add():
	for i in range(6):
		if board[5-i][2] == null:
			var value = str(5-i) + str(2)
			var button = get_node("GridContainer/"+value)
			if button:
				button.disabled = false
				board[5-i][2] = playerSymbol[playerTurn%2]
				if playerTurn % 2 == 1:
					pass
			break
	playerTurn += 1

func _column3Add():
	for i in range(6):
		if board[5-i][3] == null:
			var value = str(5-i) + str(3)
			var button = get_node("GridContainer/"+value)
			if button:
				button.disabled = false
				board[5-i][3] = playerSymbol[playerTurn%2]
				if playerTurn % 2 == 1:
					pass
			break
	playerTurn += 1


func _column4Add():
	for i in range(6):
		if board[5-i][4] == null:
			var value = str(5-i) + str(4)
			var button = get_node("GridContainer/"+value)
			if button:
				button.disabled = false
				board[5-i][4] = playerSymbol[playerTurn%2]
				if playerTurn % 2 == 1:
					pass
			break
	playerTurn += 1

func _column5Add():
	for i in range(6):
		if board[5-i][5] == null:
			var value = str(5-i) + str(5)
			var button = get_node("GridContainer/"+value)
			if button:
				button.disabled = false
				board[5-i][5] = playerSymbol[playerTurn%2]
				if playerTurn % 2 == 1:
					pass
			break
	playerTurn += 1

func _column6Add():
	for i in range(6):
		if board[5-i][6] == null:
			var value = str(5-i) + str(6)
			var button = get_node("GridContainer/"+value)
			if button:
				button.disabled = false
				board[5-i][6] = playerSymbol[playerTurn%2]
				if playerTurn % 2 == 1:
					pass
			break
	playerTurn += 1

func _column7Add():
	for i in range(6):
		if board[5-i][7] == null:
			var value = str(5-i) + str(7)
			var button = get_node("GridContainer/"+value)
			if button:
				button.disabled = false
				board[5-i][7] = playerSymbol[playerTurn%2]
				if playerTurn % 2 == 1:
					pass
			break


func _column2_add():
	pass # Replace with function body.


func _column3_add():
	pass # Replace with function body.


func _column4_add():
	pass # Replace with function body.


func _column5_add():
	pass # Replace with function body.


func _column6_add():
	pass # Replace with function body.


func _column7_add():
	pass # Replace with function body.


func _column8_add():
	pass # Replace with function body.

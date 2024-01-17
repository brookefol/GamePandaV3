extends Control

var boardArray = [
		["-", "-", "-", "-", "-", "-"], 
		["-", "-", "-", "-", "-", "-"], 
		["-", "-", "-", "-", "-", "-"], 
		["-", "-", "-", "-", "-", "-"],
		["-", "-", "-", "-", "-", "-"], 
		["-", "-", "-", "-", "-", "-"],
		["-", "-", "-", "-", "-", "-"], 
		["-", "-", "-", "-", "-", "-"]]

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
	for i in range(6):
		for j in range(8):
			var value = str(i) + str(j)
			var button = get_node("GridContainer2/"+value)
			if button:
				button.disabled = not button.disabled

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _updateBoard():
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
		if boardArray[0][i] == "-":
			boardArray[0][i] = "X"
			_updateBoard()
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

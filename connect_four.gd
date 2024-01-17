extends Control

var board = [
	[null, null, null, null, null, null, null, null], 
	[null, null, null, null, null, null, null, null], 
	[null, null, null, null, null, null, null, null], 
	[null, null, null, null, null, null, null, null], 
	[null, null, null, null, null, null, null, null], 
	[null, null, null, null, null, null, null, null]]

var playerTurn = 0
var playerSymbol = "X"

# Called when the node enters the scene tree for the first time.
func _ready():
	_setChipsOff()

func _setChipsOff():
	for i in range(6):
		for j in range(8):
			var value = str(i) + str(j)
			print(value)
			var button = get_node("GridContainer/"+value)
			print(button is Button)
			if button:
				button.disabled = not button.disabled

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_column0Add():
	for i in range(6):
		if board[5-i][0] == null:
			var value = str(5-i) + str(0)
			var button = get_node("GridContainer/"+value)
			if button:
				button.disabled = not button.disabled
				board[5-i][0] = playerSymbol
				if playerTurn % 2 == 1:
					button.focused = not button.focused
			break
	playerTurn += 1

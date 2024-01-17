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


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _updateBoard():
	for i in range(6):
		for j in range(8):
			if boardArray[j][i] != "-":
				var button = get_node("oneone")
				button.visible = not button.visible


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

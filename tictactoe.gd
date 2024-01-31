extends Node2D

var grid_pos : Vector2i 
var board_size: int
var cell_size: int



# Called when the node enters the scene tree for the first time.
func _ready():
	board_size = $Board.texture.get_width() # Replace with function body.
	# divide board size by 3 to get size of individual cells
	cell_size = board_size / 3
	
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
	
			if event.position.x < board_size:
				# convert mouse position into grid position
				grid_pos = Vector2i((event.position)/(cell_size))
				print(grid_pos)

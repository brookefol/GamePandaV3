extends Node

@export var circle_scene: PackedScene

var player: int
var grid_data: Array
var grid_pos: Vector2i # creates (x,y) as variable
var board_size: int
var cell_size: int

# Called when the node enters the scene tree for the first time.
func _ready():
	board_size = $Board.texture.get_width() # Replace with function body.
	# board size divided by 3 to split boxes to get individual cells
	cell_size = board_size/3
	new_game()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if event.position.x < board_size:
				grid_pos = Vector2i(event.position/cell_size) # turning mouse position into coordinates for each of the 9 boxes
				
				if grid_data[grid_pos.y][grid_pos.x] == 0:
					grid_data[grid_pos.y][grid_pos.x] = player # y = up/down, x = left/right
					# placing x or o according to player decision
					create_marker(player, (grid_pos * cell_size + Vector2i(cell_size/2, cell_size/2)))
					player *= -1
					print(grid_data)
				

func new_game():
	player = 1
	grid_data = [
		[0, 0, 0], 
		[0, 0, 0], 
		[0, 0, 0]
		] # three rows of three
		
func create_marker(player, position):
	#creating markers (x or o)
	if player == 1:
		var circle = circle_scene.instantiate()
		circle.position = position
		add_child(circle)

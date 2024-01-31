extends Node

@export var circle_scene: PackedScene
@export var cross_scene: PackedScene


var player: int
var moves: int
var winner: int
var temp_marker
var player_panel_pos: Vector2i
var grid_data: Array

var grid_pos: Vector2i # creates (x,y) as variable
var board_size: int
var cell_size: int

var row_sum: int
var col_sum: int
var diagonal1_sum: int
var diagonal2_sum: int

# Called when the node enters the scene tree for the first time.
func _ready():
	board_size = $Board.texture.get_width() # Replace with function body.
	# board size divided by 3 to split boxes to get individual cells
	cell_size = board_size/3
	#getting coords of the small panel on right side
	player_panel_pos = $PlayerPanel.get_position()
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
					moves += 1
					grid_data[grid_pos.y][grid_pos.x] = player # y = up/down, x = left/right
					# placing x or o according to player decision
					create_marker(player, (grid_pos * cell_size + Vector2i(cell_size/2, cell_size/2)))
					
					if check_win() != 0:
						get_tree().paused = true
						$GameOverMenu.show()
						
						if winner == 1:
							$GameOverMenu.get_node("ResultLabel").text = "Player 1 Wins!"
						elif winner == -1:
							$GameOverMenu.get_node("ResultLabel").text = "Player 2 Wins!"
						
					#checking if board is filled
					elif moves == 9:
						get_tree().paused = true
						$GameOverMenu.show()
						$GameOverMenu.get_node("ResultLabel").text = "It's a Tie!"
						
					# if this breaks the game, then set check win to go to game over and then back screen
					player *= -1
					#updating panel marker
					temp_marker.queue_free()
					create_marker(player, player_panel_pos + Vector2i(cell_size/2, cell_size/2), true)
					print(grid_data)
				

func new_game():
	player = 1
	moves = 0
	winner = 0
	grid_data = [
		[0, 0, 0], 
		[0, 0, 0], 
		[0, 0, 0]
		] # three rows of three
	# creating marker to show the turn of starting player
	
	row_sum = 0
	col_sum = 0
	diagonal1_sum = 0
	diagonal2_sum = 0
	
	#clearing existing x's and o's on screen
	get_tree().call_group("circles", "queue_free")
	get_tree().call_group("crosses", "queue_free")
	
	create_marker(player, player_panel_pos + Vector2i(cell_size / 2, cell_size / 2), true)
	$GameOverMenu.hide()
	get_tree().paused = false
		
func create_marker(player, position, temp=false):
	#creating markers (x or o)
	if player == 1:
		var circle = circle_scene.instantiate()
		circle.position = position
		add_child(circle)
		if temp: temp_marker = circle # if temp = true
		
	else:
		var cross = cross_scene.instantiate()
		cross.position = position
		add_child(cross)
		if temp: temp_marker = cross # if temp = true

func check_win():
	for i in len(grid_data):
		row_sum = grid_data[i][0] + grid_data[i][1] + grid_data[i][2]
		col_sum = grid_data[0][i] + grid_data[1][i] + grid_data[2][i]
		
		diagonal1_sum = grid_data[0][0] + grid_data[1][1] + grid_data[2][2]
		diagonal2_sum = grid_data[0][2] + grid_data[1][1] + grid_data[2][0]
		
		if row_sum == 3 or col_sum == 3 or diagonal1_sum == 3 or diagonal2_sum == 3:
			winner = 1
		
		elif row_sum == -3 or col_sum == -3 or diagonal1_sum == -3 or diagonal2_sum == -3:
			winner = -1
		
	return winner


func _on_game_over_menu_restart():
	new_game() # Replace with function body.

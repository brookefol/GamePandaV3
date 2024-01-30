extends Control

var speed = 20 
var play = true
var count = 0;
var player = 0
var playerScores = []
var playerOneScore = 0;
var playerTwoScore = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	get_window().size = Vector2i(1920, 1080)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if count<6:
		if (play == true):
			_xMovement()
		if (Input.is_action_just_pressed("ui_accept")):
			play = false
			playerScores.insert(player, _distance())
			if (player == 0):
				await get_tree().create_timer(1.0).timeout
				player = 1
				var past = $CurrentPlayerOne
				var current = $CurrentPlayerTwo
				past.visible = false
				current.visible = true
				count += 1
				play = true
			else:
				await get_tree().create_timer(1.0).timeout
				player = 0
				var past = $CurrentPlayerTwo
				var current = $CurrentPlayerOne
				past.visible = false
				current.visible = true
				count += 1
				play = true
		if (playerScores.size()==2):
			if (playerScores[0] < playerScores[1]):
				var scoreChange = $PlayerOneScore
				playerOneScore+= 1;
				scoreChange.text = str(playerOneScore)
			if (playerScores[0] > playerScores[1]):
				var scoreChange = $PlayerTwoScore
				playerTwoScore+= 1;
				scoreChange.text = str(playerTwoScore)
			playerScores.clear();
	else:
		if (playerOneScore>playerTwoScore):
			var win = $PlayerOneWins
			var marker = $marker
			win.visible = true;
			marker.visible = false
		if (playerOneScore<playerTwoScore):
			var win = $PlayerTwoWins
			var marker = $marker
			win.visible = true;
			marker.visible = false
	pass


func _xMovement():
	var target = $marker
	target.position.x+= speed;
	if (target.position.x >= 1370):
		speed = -20;
		target.position.y += 50
	if (target.position.x<= 540):
		speed = 20
		target.position.y += 50
	if (target.position.y >= 865):
		target.position.y = 220
		
func _distance():
	var center = $center
	var marker = $marker
	return sqrt(((center.position.x-marker.position.x)*(center.position.x-marker.position.x)) + ((center.position.y-marker.position.y)*(center.position.y-marker.position.y)))

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/navigation.tscn")
	pass # Replace with function body.

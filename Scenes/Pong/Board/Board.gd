extends Node

var Player1Score = 0
var Player2Score = 0

func _ready():
	get_window().size = Vector2i(1920, 1080)

func _on_left_wall_body_entered(body):
	$Ball.position = Vector2(960,540)
	Player2Score += 1
	get_tree().call_group('BallGroup', 'stop_ball')
	$Timer.start()
	$TimerDisplay.visible = true
	$ScoreSound.play()

func _on_right_wall_body_entered(body):
	$Ball.position = Vector2(960,540)
	Player1Score += 1
	get_tree().call_group('BallGroup', 'stop_ball')
	$Timer.start()
	$TimerDisplay.visible = true
	$ScoreSound.play()

func _process(delta):
	$Player1Score.text = str(Player1Score)
	$Player2Score.text = str(Player2Score)
	$TimerDisplay.text = 'Ball Starts in ' + str(int($Timer.time_left) + 1)

func _on_timer_timeout():
	get_tree().call_group('BallGroup', 'start_ball')
	$TimerDisplay.visible = false


func _on_exit_pressed():
	get_tree().change_scene_to_file("res://Scenes/navigation.tscn")

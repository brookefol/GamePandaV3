#extends Control
extends CharacterBody2D


# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


var speed = 25
func _physics_process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		velocity.y-=1
	if Input.is_action_pressed("ui_down"):
		velocity.y+=1
	#move_and_slide()
	move_and_collide(velocity * speed)	

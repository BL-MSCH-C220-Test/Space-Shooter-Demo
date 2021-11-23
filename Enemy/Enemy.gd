extends KinematicBody2D

var direction = Vector2(1.5,0)
var wobble = 30.0
var initial_position = Vector2(-100, 400)

func _ready():
	position = initial_position

func _physics_process(_delta):
	position += direction
	position.y = initial_position.y + sin(position.x/20)*wobble
	if position.x > Global.VP.x + 150 or position.x < -150:
		queue_free()


func _on_Timer_timeout():
	#shoot
	pass

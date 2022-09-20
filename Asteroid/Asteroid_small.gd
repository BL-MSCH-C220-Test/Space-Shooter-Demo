extends KinematicBody2D

var health = 5
var velocity = Vector2.ZERO

func _physics_process(_delta):
	position += velocity
	position.x = wrapf(position.x,0,Global.VP.x)
	position.y = wrapf(position.y,0,Global.VP.y)

func damage(d):
	health -= d
	if health <= 0:
		Global.update_score(100)
		queue_free()

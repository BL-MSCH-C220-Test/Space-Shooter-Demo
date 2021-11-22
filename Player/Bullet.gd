extends KinematicBody2D

var velocity = Vector2.ZERO
var max_speed = 1000.0
var accel = Vector2(0,-15)
var damage = 1

var Effects = null
onready var Explosion = load("res://Effects/Explosion.tscn")

func _physics_process(_delta):
	velocity += accel.rotated(rotation)
	velocity = velocity.normalized() * clamp(velocity.length(),0,max_speed)
	velocity = move_and_slide(velocity, Vector2.ZERO)
	position.x = wrapf(position.x, 0, Global.VP.x)
	position.y = wrapf(position.y, 0, Global.VP.y)

func shoot(p, r, v):
	global_position = p
	rotation = r
	velocity = v

func _on_Timer_timeout():
	queue_free()

func _on_Area2D_body_entered(body):
	if body.has_method("damage"):
		body.damage(damage)
	Effects = get_node_or_null("/root/Game/Effects")
	if Effects != null:
		var explosion = Explosion.instance()
		Effects.add_child(explosion)
		explosion.global_position = global_position
	queue_free()

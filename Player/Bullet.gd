extends Area2D

var velocity = Vector2.ZERO
var accel = Vector2(0,-1)
var damage = 1

var Effects = null
onready var Explosion = load("res://Effects/Explosion.tscn")

func _physics_process(_delta):
	velocity += accel.rotated(rotation)
	position += velocity

func shoot(p, r, v):
	global_position = p
	rotation = r
	#if Vector2(0,-1).rotated(r) + 	

func _on_Bullet_body_entered(body):
	if body.has_method("damage"):
		body.damage(damage)
	Effects = get_node_or_null("/root/Game/Effects")
	if Effects != null:
		var explosion = Explosion.instance()
		Effects.add_child(explosion)
		explosion.global_position = global_position
	queue_free()

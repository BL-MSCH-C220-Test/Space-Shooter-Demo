extends KinematicBody2D

var velocity = Vector2.ZERO
var speed = 5.0
var max_speed = 400.0
var rot_speed = 5.0

var nose = Vector2(0,-45)

onready var Bullet = load("res://Player/Bullet.tscn")
var Effects = null

func _ready():
	pass


func _physics_process(_delta):
	velocity += get_input()*speed
	velocity = velocity.normalized() * clamp(velocity.length(), 0, max_speed)
	velocity = move_and_slide(velocity, Vector2.ZERO)
	position.x = wrapf(position.x, 0.0, Global.VP.x)
	position.y = wrapf(position.y, 0.0, Global.VP.y)


func get_input() -> Vector2:
	var to_return = Vector2.ZERO
	$Exhaust.hide()
	if Input.is_action_pressed("forward"):
		to_return += Vector2(0,-1)
		$Exhaust.show()
	if Input.is_action_pressed("left"):
		rotation_degrees -= rot_speed
	if Input.is_action_pressed("right"):
		rotation_degrees += rot_speed
	if Input.is_action_just_pressed("shoot"):
		if Effects == null:
			Effects = get_node_or_null("/root/Game/Effects")
		if Effects != null:
			var bullet = Bullet.instance()
			Effects.add_child(bullet)
			bullet.shoot(global_position + nose.rotated(rotation), rotation, velocity)
	return to_return.rotated(rotation)

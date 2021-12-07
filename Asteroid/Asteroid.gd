extends KinematicBody2D

var initial_speed = 3
var small_speed = 5
var velocity = Vector2.ZERO

var health = 5
onready var Asteroid_small = load("res://Asteroid/Asteroid_small.tscn")
var small_asteroids = [Vector2(0, -30), Vector2(30,30), Vector2(-30,30)]

func _ready():
	var i = Vector2(0,randf()*initial_speed).rotated(randf()*2*PI)
	velocity = i

func _physics_process(_delta):
	position += velocity
	position.x = wrapf(position.x,0,Global.VP.x)
	position.y = wrapf(position.y,0,Global.VP.y)

func damage(d):
	health -= d
	if health <= 0:
		collision_layer = 0
		var Asteroid_Container = get_node_or_null("/root/Game/Asteroid_Container")
		if Asteroid_Container != null:
			for s in small_asteroids:
				var asteroid_small = Asteroid_small.instance()
				var dir = randf()*2*PI
				var i = Vector2(0,randf()*small_speed).rotated(dir)
				Asteroid_Container.call_deferred("add_child", asteroid_small)
				asteroid_small.position = position + s.rotated(dir)
				asteroid_small.velocity = i
		queue_free()

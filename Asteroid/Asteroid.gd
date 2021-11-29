extends RigidBody2D

var initial_speed = 50
var small_speed = 200

var health = 5
onready var Asteroid_small = load("res://Asteroid/Asteroid_small.tscn")
var small_asteroids = [Vector2(0, -30), Vector2(30,30), Vector2(-30,30)]

func _ready():
	var i = Vector2(0,randf()*initial_speed).rotated(randf()*2*PI)
	apply_central_impulse(i)

func _integrate_forces(state):
	var t = state.get_transform()
	t.origin.x = wrapf(t.origin.x,0,Global.VP.x)
	t.origin.y = wrapf(t.origin.y,0,Global.VP.y)
	state.set_transform(t)

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
				Asteroid_Container.add_child(asteroid_small)
				asteroid_small.position = position + s.rotated(dir)
				asteroid_small.apply_central_impulse(i)
		queue_free()

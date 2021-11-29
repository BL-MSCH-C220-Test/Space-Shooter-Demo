extends RigidBody2D

var health = 5

func _integrate_forces(state):
	var t = state.get_transform()
	t.origin.x = wrapf(t.origin.x,0,Global.VP.x)
	t.origin.y = wrapf(t.origin.y,0,Global.VP.y)
	state.set_transform(t)

func damage(d):
	health -= d
	if health <= 0:
		queue_free()

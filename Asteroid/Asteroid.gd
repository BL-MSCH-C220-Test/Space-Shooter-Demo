extends RigidBody2D


func _integrate_forces(state):
	var t = state.get_transform()
	t.origin.x = wrapf(t.origin.x,0,Global.VP.x)
	t.origin.y = wrapf(t.origin.y,0,Global.VP.y)
	state.set_transform(t)

extends AnimatedSprite

func _ready():
	play("default")
	var Explosion_Sound = get_node_or_null("/root/Game/Explosion_Sound")
	if Explosion_Sound != null:
		Explosion_Sound.play()
	rotation_degrees = rand_range(0,359)
	set_speed_scale(rand_range(0.8,2.0))
	var s = rand_range(0.7,1.5)
	scale = Vector2(s,s)

func _on_Explosion_animation_finished():
	queue_free()

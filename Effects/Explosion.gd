extends AnimatedSprite

func _ready():
	play("default")
	rotation_degrees = rand_range(0,359)
	set_speed_scale(rand_range(0.8,2.0))
	var s = rand_range(0.7,1.5)
	scale = Vector2(s,s)

func _on_Explosion_animation_finished():
	queue_free()

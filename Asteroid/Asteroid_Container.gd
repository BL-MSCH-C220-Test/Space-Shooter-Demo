extends Node2D

onready var Asteroid = load("res://Asteroid/Asteroid.tscn")

func _physics_process(_delta):
	if get_child_count() == 0 and Global.enemies == 0:
		Global.next_level()
		if Global.level < len(Global.levels):
			for a in Global.levels[Global.level]["asteroids"]:
				var asteroid = Asteroid.instance()
				asteroid.position = a
				add_child(asteroid)


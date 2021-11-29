extends Node2D

onready var Enemy = load("res://Enemy/Enemy.tscn")
var prob = 0.9

func _physics_process(_delta):
	if get_child_count() == 0 and Global.enemies > 0:
		var enemy = Enemy.instance()
		add_child(enemy)
		Global.enemies -= 1


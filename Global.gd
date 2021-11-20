extends Node

var VP = Vector2.ZERO

func _ready():
	randomize()
	VP = get_viewport().size
	var _signal = get_tree().get_root().connect("size_changed", self, "_resize")

func _input(event):
	if event.is_action_pressed("menu"):
		get_tree().quit()

func _resize():
	VP = get_viewport().size

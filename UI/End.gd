extends Control

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _on_Button_pressed():
	Global.reset()
	var _scene = get_tree().change_scene("res://Game.tscn")

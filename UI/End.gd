extends Control

func _ready():
	pass


func _on_Button_pressed():
	Global.reset()
	var _scene = get_tree().change_scene("res://Game.tscn")

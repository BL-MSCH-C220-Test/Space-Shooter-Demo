extends Control

func _ready():
	get_tree().paused = false


func _on_Button_pressed():
	Global.reset()
	var _scene = get_tree().change_scene("res://Game.tscn")

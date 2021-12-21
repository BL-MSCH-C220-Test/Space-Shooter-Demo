extends Node2D

func _ready():
	pass


func _on_Button_pressed():
	var _scene = get_tree().change_scene("res://Game.tscn")

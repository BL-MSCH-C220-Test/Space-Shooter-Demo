extends Node2D

func _ready():
	$AnimationPlayer.play("default")


func _on_AnimationPlayer_animation_finished(_anim_name):
	var _scene = get_tree().change_scene("res://UI/End.tscn")

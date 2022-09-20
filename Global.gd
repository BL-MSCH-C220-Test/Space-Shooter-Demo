extends Node

var VP = Vector2.ZERO

var level = -1
var levels = [
	{ 'title':'Level 1', 'subtitle':'Destroy all the asteroids', 'timer':100, 'asteroids':[Vector2(100,100),Vector2(800,500)], 'enemies':1 }
]
var enemies = 1

var score = 0
var time = 100
var lives = 5

func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
	randomize()
	VP = get_viewport().size
	var _signal = get_tree().get_root().connect("size_changed", self, "_resize")

func _unhandled_input(event):
	if event.is_action_pressed("menu"):
		get_tree().quit()

func _resize():
	VP = get_viewport().size

func reset():
	score = 0
	time = 100
	lives = 5
	level = -1
	
func update_score(s):
	score += s
	var hud = get_node_or_null("/root/Game/UI/HUD")
	if hud != null:
		hud.update_score()


func update_lives(l):
	lives += l
	var hud = get_node_or_null("/root/Game/UI/HUD")
	if hud != null:
		hud.update_lives()

func next_level():
	level += 1
	if level < 0 or level >= len(levels):
		var _scene = get_tree().change_scene("res://UI/End.tscn")
	else:
		var l = get_node_or_null("/root/Game/UI/Level")
		if l != null:
			l.show_labels()

extends Control

func _ready():
	update_score()
	update_time()
	update_lives()

func update_score():
	$Score.text = "Score: " + str(Global.score)

func update_time():
	$Time.text = "Time: " + str(Global.time)

func update_lives():
	get_tree().call_group("lives", "queue_free")
	for i in range(Global.lives):
		var s = Sprite.new()
		s.texture = load("res://Assets/Player.png")
		s.scale = Vector2(0.3,0.3)
		s.position = Vector2(i*30+20, Global.VP.y - 23)
		s.add_to_group("lives")
		add_child(s)

func _on_Timer_timeout():
	Global.time -= 1
	update_time()

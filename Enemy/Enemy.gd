extends KinematicBody2D

var y_positions = [100,150,200,500,550]
var initial_position = Vector2.ZERO
var direction = Vector2(1.5,0)
var wobble = 30.0
var shoot_prob = 0.1

onready var Bullet = load("res://Enemy/Bullet.tscn")

func _ready():
	initial_position.x = -100
	if randf() > 0.5:
		initial_position.x = Global.VP.x + 100
		direction.x *= -1
	initial_position.y = y_positions[randi() % y_positions.size()]
	position = initial_position

func _physics_process(_delta):
	position += direction
	position.y = initial_position.y + sin(position.x/20)*wobble
	if position.x > Global.VP.x + 150 or position.x < -150:
		queue_free()


func _on_Timer_timeout():
	if randf() < shoot_prob:
		var Player = get_node_or_null("/root/Game/Player_Container/Player")
		var Effects = get_node_or_null("/root/Game/Effects")
		if Player != null and Effects != null:
			var bullet = Bullet.instance()
			var d = global_position.angle_to_point(Player.global_position) - PI/2
			bullet.rotation = d
			bullet.position = global_position + Vector2(0, -40).rotated(d)
			Effects.add_child(bullet)


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		body.damage(100)
		queue_free()

extends Node

signal attack
signal damaged
signal slime_dead
signal inside
signal out
signal dead_slime
signal slime_hurt

var x = false
onready var slime = $slime

export(int)var health = 20
func _ready():
	pass
func _physics_process(delta):
	if health == 0:
		emit_signal("dead_slime")
		queue_free()
	slime.animation = "default"
	

func _on_Player_killed():
	queue_free()



func _on_Player_hit():
	if x == true:
		health -= 5
		print(health)
	else:
		x = false







func _on_Area2D_area_entered(area):
	x = true
	print (x)


func _on_Area2D_area_exited(area):
	x = false
	print (x)


func _on_Area2D_body_entered(body):
	emit_signal('slime_hurt')

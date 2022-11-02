extends Node

signal attack
signal damaged
signal slime_dead
signal inside
signal out
signal dead_slime

var y = false
onready var slime = $slime

export(int)var health = 20
func _ready():
	pass
func _physics_process(delta):
	if health == 0:
		queue_free()
	slime.animation = "default"
	

func _on_Player_killed():
	queue_free()


func _on_Player_hit():
	if y == true:
		health -= 5
		print(health)
	else:
		y = false






func _on_melee_range_area_entered(area):
	y = true
	print (y)


func _on_melee_range_area_exited(area):
	y = false
	print (y)

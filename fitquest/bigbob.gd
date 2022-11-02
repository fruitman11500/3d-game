extends Node


signal big_bob_close_hit
signal truth

var y = false
var bulletpath = preload("res://Big_bob_bullet.tscn")
var bullet = bulletpath.instance()
var timer = Timer.new()
var can_fire = true
var pos = connect('pos',self,'pos')

func _ready():
	timer.wait_time = 1.5
	add_child(timer)
	
func _on_close_damage_area_entered(area):
	emit_signal("big_bob_close_hit")

func can_fire_func():
	timer.start()
	yield(timer, 'timeout')
	can_fire = true
	
func _physics_process(delta):
	if y == true and can_fire == true:
		$Node2D.look_at(pos)
		can_fire = true
		bullet.position = $Position2D.get_global_position()
		get_tree().get_root().add_child(bulletpath.instance())
		can_fire = false
		can_fire_func()
		





func _on_range_damage_area_entered(area):
	y = true
func _on_range_damage_area_exited(area):
	y = false



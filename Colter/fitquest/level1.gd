extends Node2D 
signal loading
signal finished

var timer = Timer.new()
func _on_Player_end():
	timer.wait_time = 3
	emit_signal('loading')
	add_child(timer)
	timer.start()
	yield (timer,"timeout")
	emit_signal("finished")
	queue_free()
	

extends KinematicBody


var velocity = Vector3.ZERO


func get_input():
	if Input.is_action_pressed("down"):
		velocity.y -= 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

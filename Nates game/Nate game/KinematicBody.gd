extends KinematicBody


var velocity = Vector3.ZERO
var speed = 50

func get_input():
	if Input.is_action_pressed("left"):
		velocity.x = -1
	elif Input.is_action_pressed("right"):
		velocity.x = 1
	else:
		velocity.x = 0
	if Input.is_action_pressed("down"):
		velocity.z = 1 
	elif Input.is_action_pressed("up"):
		velocity.z = -1
	else:
		velocity.z = 0

func _physics_process(delta):
	get_input()
	Vector3(0,0,0).rotated(rotation.normalized(),$Spatial.camrot_h)
	move_and_slide(velocity * speed)
	print ($Spatial.camrot_h)

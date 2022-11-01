extends KinematicBody


var velocity = Vector3.FORWARD
var speed = 50
var h_rot = $Spatial/h.global_transform.basis.get_euler().y

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
	Vector3()
	get_input()
	move_and_slide(velocity * speed)

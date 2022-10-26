extends KinematicBody



var speed = 10
onready var camera = $Spatial
var face_left = false
var face_right = false 
var face_back = false 
var face_forward = true
var velocity = Vector3.ZERO
func _ready():
	camera = Vector3(0,1,0)
func get_input():
	if Input.is_action_pressed("left"):
		velocity.x = -1
		face_left = true
		face_back = false
		face_forward = false 
		face_right = false
	elif Input.is_action_pressed('right'):
		velocity.x = 1
		face_right = true
		face_back = false
		face_forward = false
		face_left = false
	else:
		velocity.x = 0
	if Input.is_action_pressed("down"):
		velocity.z = 1
		face_back = true
		face_forward = false
		face_left = false
		face_right = false
	elif Input.is_action_pressed('up'):
		velocity.z = -1
		face_forward = true
		face_back = false
		face_left = false
		face_right = false
	else:
		velocity.z = 0

func _physics_process(delta):
	get_input()
	move_and_slide(velocity * speed)
	print(velocity)
	
	
func camera():
	if face_back == true:
		camera.y = 180
	if face_forward == true:
		camera.rotation_degrees.y = 0
	if face_left == true:
		camera.rotation_degrees.y = -90
	if face_right == true:
		camera.rotation_degrees.y = 90

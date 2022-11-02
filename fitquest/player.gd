extends KinematicBody2D

signal killed
signal hurt
signal hit
signal damage
signal end

export (bool) var health_update = true
export (float) var damage = 0
export (int) var speed = 200
export (int) var health = 100
var velocity = Vector2()
onready var animation1 = $animations
var face_left = false
var face_right = false
var timer = Timer.new()


func ready():
	health == 100
	$Control.connect("value", self, "health")
	animation1.animation = 'idle'
	face_left = false
	face_right = false
	health += 10
	
func get_input():
	velocity = Vector2()
	if Input.is_action_just_pressed("end_game"):
		emit_signal('end')
	if Input.is_action_pressed('right'):
		velocity.x += 1
		animation1.animation = "right"
		face_right = true
		face_left = false
	if Input.is_action_just_released("right"):
		animation1.animation = "idle"
	if Input.is_action_pressed('left'):
		velocity.x -= 1
		face_left = true
		face_right = false
		animation1.animation = "left"
	if Input.is_action_just_released("left"):
		animation1.animation = "idle"
	if Input.is_action_pressed('down'):
		velocity.y += 1
		animation1.animation = "down"
	if Input.is_action_just_released("down"):
		animation1.animation = 'idle'
	if Input.is_action_pressed('up'):
		velocity.y -= 1
		animation1.animation = "up"
	if Input.is_action_just_released("up"):
		animation1.animation = 'idle'
	velocity = velocity.normalized() * speed 
	if Input.is_action_just_pressed("attack"):
		emit_signal('hit')
		print('hit')
		
func _physics_process(delta):
	get_input()
	move_and_slide(velocity)
func _on_damage_area_body_entered(body):
	damage == 5
	health -= 5
	print (health)
	emit_signal('hurt')
	if health <= 0:
		emit_signal('killed')
		queue_free()



func _on_Player_hit():
	timer.wait_time = 0.35
	if face_left == true:
		print (face_left)
		animation1.animation = "attack left"
		add_child(timer)
		timer.start()
		yield(timer,"timeout")
		animation1.animation = 'idle'
	if face_left == false:
		animation1.animation = 'idle'

	if face_right == true:
		print (face_right)
		animation1.animation = "attack right"
		add_child(timer)
		timer.start()
		yield(timer,'timeout')
		animation1.animation = 'idle'
	if face_right == false:
		animation1.animation = 'idle'




func _on_bigbob_big_bob_close_hit():
	health -= 10


func _on_Node2D_finished():
	$Camera2D.make_current()


func _on_slime1_slime_hurt():
	damage == 5
	health -= 5
	print (health)
	emit_signal('hurt')
	if health <= 0:
		emit_signal('killed')

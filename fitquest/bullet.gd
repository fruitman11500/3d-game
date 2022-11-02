extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity = Vector2(0,-1)
var y = false
var speed = 10000

# Called when the node enters the scene tree for the first time.
func _ready():
	self.show()
	var timer = Timer.new()
	timer.wait_time = 1.5
	add_child(timer)
	timer.start()
	$Area2D/area.disabled = true
	y = true
	print (y)
	yield (timer, 'timeout')
	$Area2D/area.disabled = false


func _physics_process(delta):
	move_and_slide(velocity.normalized() * delta * speed)




func _on_Area2D_body_entered(body):
	if y == true:
		queue_free()

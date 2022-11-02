extends KinematicBody2D
signal finish

onready var animation = $animation
onready var label = $Label
var timer = Timer.new()
var t = Timer.new()
var ti = Timer.new()
var speed = 150
var velocity = Vector2()

func _ready():
	animation.animation = "attack"
	ti.wait_time = 9.5
	t.wait_time = 1

func _physics_process(delta):
	move_and_slide(velocity)

func _on_slime1_dead_slime():
	print("thats crazy")
	animation.animation = "idle"
	label.text = "Wow, I dont know how to thank you"
	add_child(t)
	t.start()
	yield(t,'timeout')
	label.text = "How did you get in here"
	add_child(t)
	t.start()
	yield(t,'timeout')
	label.text = "You know what doesn't matter"
	add_child(t)
	t.start()
	yield(t,'timeout')
	label.text = 'come on, let\'s get out of here'
	add_child(t)
	t.start()
	yield(t,'timeout')
	label.text = ''
	emit_signal('finish')



func _on_guide_finish():
	print("She is finished")
	velocity.x += 100
	animation.animation = "right"
	add_child(ti)
	ti.start()
	yield(ti,"timeout")
	velocity.x -= 100
	animation.animation = "idle"
	label.text = "I have to tend to my wounds"
	add_child(t)
	t.start()
	yield(t,'timeout')
	label.text = 'See if you can find a way out of here'
	add_child(t)
	t.start()
	yield(t,"timeout")
	label.text = ''
	

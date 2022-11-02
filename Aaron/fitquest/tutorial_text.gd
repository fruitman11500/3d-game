extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var tutorial = $Label
var t = Timer.new()
var ti = Timer.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	tutorial.text = 'Use WASD to move'
	t.wait_time = 3
	t.one_shot = true
	add_child(t)
	t.start()
	yield(t,"timeout")
	tutorial.text = "Use left mouse to attack"
	ti.wait_time = 3
	add_child(ti)
	ti.start()


func _on_Area2D_area_entered(area):
	yield(ti,'timeout')
	tutorial.text = "She needs help"

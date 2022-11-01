extends Spatial


var camrot_h = 0
func _ready():
	$h/ClippedCamera.add_exception(get_parent())

func _input(event):
	if event is InputEventMouseMotion and Input.is_action_pressed("right_click"):
		camrot_h += event.relative.x

func _physics_process(delta):
	$h.rotation_degrees.y = camrot_h

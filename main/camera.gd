extends Spatial


var camrot_h = 0
func _ready():
	$ClippedCamera.add_exception(get_parent())

func _input(event):
	if event is InputEventMouseMotion:
		camrot_h += event.relative.x

func _physics_process(delta):
	

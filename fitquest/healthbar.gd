extends TextureProgress

onready var health = get_node("/root/world/Player").health

func _ready():
	value == 100

func _on_Player_hurt():
	value -= 5

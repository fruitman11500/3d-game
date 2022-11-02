extends Control

onready var health = get_node("/root/world/Player").health

func _ready():
	$TextureProgress.value = health

func _on_Player_hurt():
	$TextureProgress.value -= 5


func _on_bigbob_big_bob_close_hit():
	$TextureProgress.value -= 10

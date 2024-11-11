extends KinematicBody

var vel = Vector3()

var explosao = load("res://Scenes/particulas.tscn")
onready var main = get_tree().current_scene
onready var ui = get_node("/root/main/placar")
func _ready():
	pass
func _physics_process(delta):
	move_and_slide(vel)


func _on_Area_body_entered(body):
	if body.name != "player":
		body.queue_free()
		var particulas = explosao.instance()
		main.add_child(particulas)
		particulas.transform.origin = transform.origin
		ui.pontua()
		queue_free()

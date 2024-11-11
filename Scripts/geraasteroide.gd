extends Spatial

onready var main = get_tree().current_scene

var asteroid = load("res://Scenes/asteroide.tscn")

func _ready():
	$Timer.set_wait_time(rand_range(0.3,0.6))

func spawn():
	var ast = asteroid.instance()
	
	main.add_child(ast)
	
	ast.transform.origin = transform.origin + Vector3(rand_range(-3,3), rand_range(-3,3), 0)



func _on_Timer_timeout():
	spawn()

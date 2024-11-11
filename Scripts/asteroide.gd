extends KinematicBody

var vel = rand_range(20,60)

func _ready():
	randomize()
	pass
func _physics_process(delta):
	move_and_slide(Vector3(0,0,vel))

func _on_Timer_timeout():
	queue_free()

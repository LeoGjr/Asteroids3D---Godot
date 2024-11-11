extends KinematicBody

const vmax = 12

const ac = 0.26

var desloc = Vector3(0,0,0)

var vel = Vector3()

onready var lasers = [$laser1, $laser2]
onready var main = get_tree().current_scene
var tiro = load("res://Scenes/tiro.tscn")

var congela = 0
const congelamento = 8

func _ready():
	pass
func _physics_process(delta):
	desloc.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	desloc.y = Input.get_action_strength("ui_up") - Input.get_action_strength("ui_down")
	
	desloc = desloc.normalized()
	
	vel.x = move_toward(vel.x, desloc.x * vmax, ac)
	vel.y = move_toward(vel.y, desloc.y * vmax, ac)
	
	rotation_degrees.z = vel.x * (-2)
	rotation_degrees.x = vel.y/2
	rotation_degrees.y = vel.x/(-2)
	
	move_and_slide(vel)
	
	transform.origin.x = clamp(transform.origin.x, -5, 5)
	transform.origin.y = clamp(transform.origin.y, -3, 3)
	
	if Input.is_action_pressed("ui_accept") and congela <= 0:
		$tiro.play()
		congela = congelamento * delta
		for i in lasers:
			var tirolaser = tiro.instance()
			main.add_child(tirolaser)
			tirolaser.transform = i.global_transform
			tirolaser.vel = tirolaser.transform.basis.z * (-600)
			
	if congela > 0:
		congela = congela - delta

extends CanvasLayer

func _ready():
	$TextureProgress.value = 100


func _on_Timer_timeout():
	if $TextureProgress.value >= 3:
		$TextureProgress.value -= 3

func pontua():
	$explode.play()
	if $TextureProgress.value <= 90:
		$TextureProgress.value += 10
		
		
func _process(delta):
	if $TextureProgress.value == 0:
		get_tree().reload_current_scene()

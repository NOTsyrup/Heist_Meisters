extends CanvasModulate

const DARK = Color("131313")
const NIGHTVISION = Color("37bf62")

var sound_cooldown = false

func _ready():
	visible = true
	color = DARK


func cycle_vision_mode():
	if not sound_cooldown:
		sound_cooldown = true
		if color == DARK:
			NIGHTVISION_mode()
		else:
			DARK_mode()
		$Timer.start()
		
		
func DARK_mode():
	color = DARK
	$AudioStreamPlayer.stream = load("res://SFX/nightvision_off.wav")
	$AudioStreamPlayer.play()
	
	get_tree().call_group("lights", "show")
	get_tree().call_group("labels", "hide")
	
		
		
func NIGHTVISION_mode():
	color = NIGHTVISION
	$AudioStreamPlayer.stream = load("res://SFX/nightvision.wav")
	$AudioStreamPlayer.play()
	
	get_tree().call_group("lights", "hide")
	get_tree().call_group("labels", "show")

func _on_Timer_timeout():
	sound_cooldown = false

extends CanvasModulate

const DARK = Color("1f1f1f")
const NIGHTVISION = Color("37bf62")

var sound_cooldown = false

func _ready():
	color = DARK
	visible = true


func cycle_vision_mode():
	if color == DARK and not sound_cooldown:
		sound_cooldown = true
		color = NIGHTVISION
		$AudioStreamPlayer.stream = load("res://SFX/nightvision.wav")
		$AudioStreamPlayer.play()
		$Timer.start()
		
	if color == NIGHTVISION and not sound_cooldown:
		sound_cooldown = true
		color = DARK
		$AudioStreamPlayer.stream = load("res://SFX/nightvision_off.wav")
		$AudioStreamPlayer.play()
		$Timer.start()


func _on_Timer_timeout():
	sound_cooldown = false

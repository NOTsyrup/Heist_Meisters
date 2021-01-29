extends ColorRect



func _on_Area2D_body_entered(body):
	if body.has_node("Breifcase"):
		get_tree().change_scene("res://Levels/VictoryScreen.tscn")

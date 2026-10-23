extends Label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text = str(Global.score)
	if Global.score > Global.highScore:
		Global.highScore = Global.score

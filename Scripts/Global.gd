extends Node

var score: int = 0
var highScore: int = 0
const SAVE_PATH = "user://highscore.save" # Saves safely to the player's device

func _ready() -> void:
	load_highscore()

func save_highscore() -> void:
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if file:
		file.store_32(highScore)

func load_highscore() -> void:
	if FileAccess.file_exists(SAVE_PATH):
		var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
		if file:
			highScore = file.get_32()

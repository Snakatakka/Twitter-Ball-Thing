extends Node2D

@onready var ball_1_name : Label = $HBoxContainer/Ball1Name
@onready var ball_2_name : Label = $HBoxContainer/Ball2Name

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var voices : Array = DisplayServer.tts_get_voices_for_language("en")
	var voice_id = voices[2]
	var spiel : String = ball_1_name.text + " versus " + ball_2_name.text + ". Who will win?"
	DisplayServer.tts_speak(spiel, voice_id)

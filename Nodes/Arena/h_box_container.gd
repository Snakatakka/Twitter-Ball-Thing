@tool
extends HBoxContainer

@onready var ball_1_name : Label = $Ball1Name
@onready var ball_2_name : Label = $Ball2Name
@onready var ball_1_start : Node2D = $"../Ball1Start"
@onready var ball_2_start : Node2D = $"../Ball2Start"

# Called when the node enters the scene tree for the first time.
func _process(_delta: float) -> void:
	ball_1_name.text = ball_1_start.ball_name
	ball_2_name.text = ball_2_start.ball_name

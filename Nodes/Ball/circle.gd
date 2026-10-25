extends Node2D

@onready var ball : Node2D = $".."
@onready var hitbox : Node2D = $"../Hitbox"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _draw() -> void:
	draw_circle(ball.position, ball.radius, ball.color)

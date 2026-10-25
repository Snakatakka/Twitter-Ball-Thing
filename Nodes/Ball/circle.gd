@tool
extends Node2D

@onready var ball : Node2D = $".."
@onready var collision_shape : CollisionShape2D = $"../CollisionShape"
func _draw() -> void:
	draw_circle(collision_shape.position, ball.radius, ball.color)
	draw_circle(collision_shape.position, ball.radius, ball.outline_color, false, 2.5, true)

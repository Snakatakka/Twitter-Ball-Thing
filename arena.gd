extends Node2D
@onready var color_rect : ColorRect = $ColorRect
func _draw() -> void:
	draw_rect(Rect2(color_rect.position, color_rect.size), Color(0, 0, 0, 1), false, 4, true)

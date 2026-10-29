extends Node2D

@onready var ball : RigidBody2D = get_parent()
@onready var collision_shape : CollisionShape2D = $"../CollisionShape"
var rotation_speed : float = 1.0
var clockwise : bool = true

func _ready() -> void:
	position = collision_shape.position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position = collision_shape.position
	if Engine.time_scale != 0:
		if clockwise:
			rotation += (rotation_speed / 10)
		else:
			rotation -= (rotation_speed / 10)

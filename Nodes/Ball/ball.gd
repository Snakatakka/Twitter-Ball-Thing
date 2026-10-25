extends RigidBody2D

@export var color : Color = Color(255, 255, 255, 1)
@export var outline_color : Color = Color(0, 0, 0, 1)
@export var radius : float = 50.0

@onready var collision_shape : CollisionShape2D = $CollisionShape

var speed : int = 5

func _ready() -> void:
	collision_shape.shape.radius = radius
	apply_central_impulse(Vector2(1000, 0))

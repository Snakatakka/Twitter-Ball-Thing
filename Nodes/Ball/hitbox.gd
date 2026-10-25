extends RigidBody2D
@onready var collision_shape : CollisionShape2D = $CollisionShape
@onready var ball : Node2D = $".."
var x_velocity : float = 5.0
var y_velocity : float = 5.0

func _get_random_float(min, max) -> float:
	var rng : RandomNumberGenerator = RandomNumberGenerator.new()
	var random : float = rng.randf_range(min, max)
	return random

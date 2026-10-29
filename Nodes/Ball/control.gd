extends Control
@onready var ball : RigidBody2D = $".."
@onready var collision_shape : CollisionShape2D = $"../CollisionShape"
@onready var label : Label = $Label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	global_position = collision_shape.global_position
	label.text = str(roundi(ball.health))

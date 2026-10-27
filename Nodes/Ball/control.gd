extends Control
@onready var ball : RigidBody2D = $".."
@onready var collision_shape : CollisionShape2D = $"../CollisionShape"
@onready var label : Label = $Label
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	global_position = collision_shape.global_position
	label.text = str(ball.health)

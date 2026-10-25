@tool
extends RigidBody2D

@onready var ball : Node2D = $".."
@onready var hitbox : CollisionShape2D = $HitboxShape

var x_velocity : float = 1
var y_velocity : float = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global_position = ball.global_position
	hitbox.shape.radius = ball.radius

func _process(delta: float) -> void:
	if not Engine.is_editor_hint():
		_handle_x_collision()
		_handle_y_collision()
		var update : Vector2 = Vector2(x_velocity, y_velocity)
		ball.global_position += update

func _handle_x_collision() -> void:
	var x_viewport : float = get_parent().get_viewport_rect().size.x
	
	if (ball.global_position.x >= x_viewport / 2 - ball.radius):
		if x_velocity > 0:
			x_velocity = x_velocity * -1
	elif (ball.global_position.x <= -(x_viewport) / 2 + ball.radius):
		if x_velocity < 0:
			x_velocity = x_velocity * -1

func _handle_y_collision() -> void:
	var y_viewport : float = get_parent().get_viewport_rect().size.y
	
	if (ball.global_position.y >= (y_viewport) / 2 - ball.radius):
		if y_velocity > 0:
			y_velocity = y_velocity * -1
	elif (ball.global_position.y <= -(y_viewport) / 2 + ball.radius):
		if y_velocity < 0:
			y_velocity = y_velocity * -1

func _on_body_entered(body: Node) -> void:
	print("Collided!")

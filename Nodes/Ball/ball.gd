@tool
extends RigidBody2D

@export var color : Color = Color(255, 255, 255, 1)
@export var outline_color : Color = Color(0, 0, 0, 1)
@export var radius : float = 40

@onready var collision_shape : CollisionShape2D = $CollisionShape
@onready var weapon_pivot : Node2D = $WeaponPivot

var health : int = 100

func _ready() -> void:
	get_parent().ball_name = name
	collision_shape.position = get_parent().position
	collision_shape.shape.radius = radius
	
	if get_parent().name == "Ball1Start":
		weapon_pivot.clockwise = false
	
	if not Engine.is_editor_hint():
		await get_tree().create_timer(3).timeout
		gravity_scale = 0.95
		apply_central_impulse(Vector2(_get_random_float(-200, 200), _get_random_float(-200, 200)))

func _get_random_float(min : float, max : float) -> float:
	var rng : RandomNumberGenerator = RandomNumberGenerator.new()
	return rng.randi_range(min, max)

func _on_body_entered(body: Node) -> void:
	pass

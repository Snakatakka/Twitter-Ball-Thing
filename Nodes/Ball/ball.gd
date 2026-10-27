extends RigidBody2D

@export var color : Color = Color(255, 255, 255, 1)
@export var outline_color : Color = Color(0, 0, 0, 1)
@export var radius : float = 40

@onready var collision_shape : CollisionShape2D = $CollisionShape

var health : int = 100

func _ready() -> void:
	collision_shape.position = get_parent().position
	collision_shape.shape.radius = radius
	
	await get_tree().create_timer(3).timeout
	gravity_scale = 0.9
	apply_central_impulse(Vector2(_get_random_float(-150, 150), _get_random_float(-150, 150)))

func _get_random_float(min : float, max : float) -> float:
	var rng : RandomNumberGenerator = RandomNumberGenerator.new()
	return rng.randi_range(min, max)

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("Weapon"):
		health -= 5
		if health <= 0:
			call_deferred("queue_free")

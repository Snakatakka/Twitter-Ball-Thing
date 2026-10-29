@tool
extends RigidBody2D

@export var color : Color = Color(255, 255, 255, 1)
@export var outline_color : Color = Color(0, 0, 0, 1)
@export var radius : float = 40

@onready var collision_shape : CollisionShape2D = $CollisionShape
@onready var weapon_pivot : Node2D = $WeaponPivot
@onready var audio_stream : AudioStreamPlayer2D = $AudioStream

var clack_sfx : AudioStream = load("res://Assets/Sound Effects/General/clack.wav")
var health : float = 100
var max_impulse : float = 250
var frozen : bool = false
var invulnerable : bool = false
var time : float = 0

func _ready() -> void:
	get_parent().ball_name = name
	collision_shape.position = get_parent().position
	collision_shape.shape.radius = radius
	
	if get_parent().name == "Ball1Start":
		weapon_pivot.clockwise = false
	
	if not Engine.is_editor_hint():
		await get_tree().create_timer(3).timeout
		gravity_scale = 1.0
		apply_central_impulse(Vector2(_get_random_float(-max_impulse, max_impulse), _get_random_float(-max_impulse, max_impulse)))

func _damaged(damage : float, body : Node2D) -> void:
	if !invulnerable:
		invulnerable = true
		body.invulnerable = true
		Engine.time_scale = 0.0 # That good hitstop effect
		await get_tree().create_timer(0.25, false, true, true).timeout
		invulnerable = false
		body.invulnerable = false
		Engine.time_scale = 1.0
		
		health -= damage
		
		if health <= 0:
			call_deferred("queue_free")
		
		body.set_collision_mask_value(1, false)
		set_collision_mask_value(1, false)
		await get_tree().create_timer(0.000001, false, true, true).timeout
		body.set_collision_mask_value(1, true)
		set_collision_mask_value(1, true)

func _get_random_float(minimum : float, maximum : float) -> float:
	var rng : RandomNumberGenerator = RandomNumberGenerator.new()
	return rng.randf_range(minimum, maximum)

func _on_body_entered(body: Node) -> void:
	audio_stream.stream = clack_sfx
	audio_stream.play() 

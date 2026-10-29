extends Node2D
@onready var ball : RigidBody2D = $"../.."
@onready var weapon_pivot : Node2D = $".."
@onready var area : Area2D = $Area2D
@onready var audio_stream : AudioStreamPlayer2D = $"../../AudioStream"
var damage : float = 1.0
var sword_sfx : AudioStream = load("res://Assets/Sound Effects/Ball/Sword/sword.wav")
var clash_sfx : AudioStream = load("res://Assets/Sound Effects/General/clash.wav")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(3).timeout
	area.monitoring = true

func _on_area_2d_area_entered(_area: Area2D) -> void:
	if area.is_in_group("Weapon"):
		audio_stream.stream = clash_sfx
		audio_stream.play()
		weapon_pivot.clockwise = !weapon_pivot.clockwise

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Ball") && (body != get_parent()) && (body.invulnerable == false):
		body._damaged(damage, ball)
		damage += 0.5
		audio_stream.stream = sword_sfx
		audio_stream.play()

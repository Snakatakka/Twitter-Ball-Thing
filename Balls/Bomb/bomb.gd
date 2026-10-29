extends Node2D

@onready var ball : RigidBody2D = $"../.."
@onready var weapon_pivot : Node2D = $".."
@onready var area : Area2D = $Area2D
@onready var audio_stream : AudioStreamPlayer2D = $"../../AudioStream"
var clash_sfx : AudioStream = load("res://Assets/Sound Effects/General/clash.wav")
var current_state : int = State.WAITING
var throw_sp


enum State {
	WAITING,
	THROWING,
	RETURNING
}


func _ready() -> void:
	await get_tree().create_timer(3).timeout
	area.monitoring = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Weapon"):
		audio_stream.stream = clash_sfx
		audio_stream.play()
		weapon_pivot.clockwise = !weapon_pivot.clockwise

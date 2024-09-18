extends RigidBody2D

@onready var _animated_sprite = $PlaneAnimation2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("flap"): 
		self.apply_force(Vector2(0, -10000))
		_animated_sprite.play("flap")


func _on_plane_animation_2d_animation_finished() -> void:
	if _animated_sprite.is_playing():
		_animated_sprite.play("glide")

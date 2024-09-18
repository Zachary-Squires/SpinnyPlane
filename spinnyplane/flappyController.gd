extends Node2D

@onready var rock_scene = load("res://rock.tscn")
@onready var timer = get_tree().root.find_child("Timer", true, false)
@onready var gOver = get_tree().root.find_child("gameOver", true, false)
@onready var hitSound = get_tree().root.find_child("thud", true, false)
@onready var plane = get_tree().root.find_child("plane", true, false)

func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func plane_hit():
	timer.stop()
	gOver.set_visible(true)
	hitSound.play()

func _on_timer_timeout() -> void:
	var rock = rock_scene.instantiate()
	self.add_child(rock)
	var coinflip = randi() % 2
	if coinflip == 1:
		rock.position = Vector2(1100, 100)
		var sprite = rock.get_node("Sprite2D")
		sprite.flip_v = true
	else:
		rock.position = Vector2(1100, 550)
	


func _on_button_pressed() -> void:
	timer.start()
	gOver.set_visible(false)

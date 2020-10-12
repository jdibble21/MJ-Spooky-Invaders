extends Area2D


export var velocity := 600
var _current_pos := Vector2()

func _ready():
	pass # Replace with function body.


func _process(delta):
	if Input.is_action_pressed("move_left"):
		_current_pos.x -= velocity * delta
	if Input.is_action_pressed("move_right"):
		_current_pos.x += velocity * delta
	self.position = _current_pos

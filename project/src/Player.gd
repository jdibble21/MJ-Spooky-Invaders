extends Area2D


export var velocity := 600
export (PackedScene) var _projectile
var _current_pos := Vector2()

func _ready():
	pass # Replace with function body.


func _process(delta):
	if Input.is_action_pressed("fire"):
		_fire()
	if Input.is_action_pressed("move_left"):
		_current_pos.x -= velocity * delta
	if Input.is_action_pressed("move_right"):
		_current_pos.x += velocity * delta
	self.position = _current_pos
	
func _fire():
	var bullet = _projectile.instance()
	var fire_coordinate = self.position
	bullet.set_fire_position(fire_coordinate)
	

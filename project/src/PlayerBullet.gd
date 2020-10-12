extends Area2D

export var velocity = 500

var _vel := Vector2()

func _ready():
	pass
	
	
func _process(delta):
	_vel.y -= velocity * delta
	self.position = _vel
	
func set_fire_position(start_position):
	self.position = start_position

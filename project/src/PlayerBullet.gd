extends Area2D

const SPEED = 600

var _vel := Vector2()
var _x_coordinate = 0

func _ready():
	pass
	
func _physics_process(delta):
	position += transform.y * -SPEED * delta

# Controls player input and firing of projectiles
extends Area2D

export (PackedScene) var Bullet
export var velocity := 600
var _current_pos := Vector2()

func _ready():
	position = Vector2(527.058,285.587)


func _process(delta):
	if Input.is_action_just_pressed("fire"):
		_fire()
	if Input.is_action_pressed("move_left"):
		_current_pos.x -= velocity * delta
	if Input.is_action_pressed("move_right"):
		_current_pos.x += velocity * delta
	self.position = _current_pos
	
	
func _fire():
	var b = Bullet.instance()
	add_child(b)
	b.transform = $Muzzle.global_transform

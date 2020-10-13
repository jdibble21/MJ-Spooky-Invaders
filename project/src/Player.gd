# Controls player input and firing of projectiles
extends KinematicBody2D

const BULLET = preload("res://src/PlayerBullet.tscn")
export var velocity := 600
var _current_pos := Vector2()

func _ready():
	pass


func _process(delta):
	if Input.is_action_just_pressed("fire"):
		_fire()
	if Input.is_action_pressed("move_left"):
		_current_pos.x -= velocity * delta
	if Input.is_action_pressed("move_right"):
		_current_pos.x += velocity * delta
	self.position = _current_pos
	
	
func _fire():
	var b = BULLET.instance()
	owner.add_child(b)
	b.transform = $Muzzle.global_transform
	

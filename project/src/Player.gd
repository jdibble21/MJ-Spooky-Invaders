# Controls player input and firing of projectiles
extends KinematicBody2D

signal player_defeated

const BULLET = preload("res://src/PlayerBullet.tscn")

export var velocity := 600

var _current_pos := Vector2()
var _screensize

func _ready():
	_screensize = get_viewport_rect().size
	pass


func _process(delta):
	if Input.is_action_just_pressed("fire"):
		_fire()
	if Input.is_action_pressed("move_left"):
		_current_pos.x -= velocity * delta
	if Input.is_action_pressed("move_right"):
		_current_pos.x += velocity * delta
	position = _current_pos
	
	
	
	
func _fire():
	var b = BULLET.instance()
	owner.add_child(b)
	b.transform = $Muzzle.global_transform
	

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
	if Input.is_action_pressed("move_left") and position.x > -479:
		_current_pos.x -= velocity * delta
	if Input.is_action_pressed("move_right") and position.x < 509:
		_current_pos.x += velocity * delta
	position = _current_pos
	print(position)
	
	
func _fire():
	var b = BULLET.instance()
	owner.add_child(b)
	b.transform = $Muzzle.global_transform
	


func _on_HitBox_area_entered(area):
	#if area.is_in_group("enemy_bullet"):
	print("Player is hit!!")


func _on_HitBox_body_entered(body):
	print("player is hit!")

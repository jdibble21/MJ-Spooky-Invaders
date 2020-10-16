# Controls player input and firing of projectiles
extends KinematicBody2D

signal player_defeated

const BULLET = preload("res://src/PlayerBullet.tscn")

export var velocity := 600

var lives := 3
var _current_pos := Vector2()
var _screensize


func _ready():
	_screensize = get_viewport_rect().size
	$AnimatedSprite.hide()
	pass


func _process(delta):
	if Input.is_action_just_pressed("fire"):
		_fire()
	if Input.is_action_pressed("move_left") and position.x > -479:
		_current_pos.x -= velocity * delta
	if Input.is_action_pressed("move_right") and position.x < 509:
		_current_pos.x += velocity * delta
	position = _current_pos
	
	
func _fire():
	var b = BULLET.instance()
	owner.add_child(b)
	b.transform = $Muzzle.global_transform
	

func _on_HitBox_area_entered(area):
	print("lives left: " + str(lives))
	if lives > 0:
		$AnimationPlayer.play("player_hit")
		lives = lives - 1
	if lives == 0:
		set_process(false)
		emit_signal("player_defeated")
		var timer = Timer.new()
		timer.set_wait_time(0.4)
		add_child(timer)
		timer.start()
		$Sprite.hide()
		$AnimatedSprite.show()
		$AnimatedSprite.play("destroyed")
		yield(timer, "timeout")
		queue_free()

func _on_HitBox_body_entered(body):
	pass

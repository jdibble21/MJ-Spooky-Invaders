# Controls player input and firing of projectiles
extends KinematicBody2D

signal player_defeated
signal point_earned
signal bonus_point_earned

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
	b.connect("hit_enemy",self,"_point_score")
	b.connect("hit_bonus_enemy",self,"_bonus_point_score")
	owner.add_child(b)
	$FireSound.play()
	b.transform = $Muzzle.global_transform
	
	
func _point_score():
	emit_signal("point_earned")
	
	
func _bonus_point_score():
	emit_signal("bonus_point_earned")
	
	
func _on_HitBox_area_entered(_area):
	if lives > 0:
		$AnimationPlayer.play("player_hit")
		$DamageSound.play()
		lives = lives - 1
	if lives == 0:
		set_process(false)
		emit_signal("player_defeated")
		var timer = Timer.new()
		timer.set_wait_time(0.4)
		add_child(timer)
		timer.start()
		$GameOverSound.play()
		$Sprite.hide()
		$AnimatedSprite.show()
		$AnimatedSprite.play("destroyed")
		yield(timer, "timeout")
		queue_free()


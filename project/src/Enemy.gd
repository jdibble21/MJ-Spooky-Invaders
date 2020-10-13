extends KinematicBody2D

const ENEMY_BULLET = preload("res://src/EnemyBullet.tscn")
onready var raycaster = $PlayerChecker
var _fire_delay := 0.0
var _just_fired := false
var _next_fire_time := 0.3
func _ready():
	$AnimatedSprite.play("idle")

func _physics_process(delta):
	if _just_fired:
		_fire_delay = _fire_delay + 0.01
	print(_fire_delay)
	if raycaster.is_colliding():
		if _fire_delay == 0:
			_fire()
			_just_fired = true
		if _fire_delay >= _next_fire_time:
			_fire_delay = 0
			_just_fired = false
	
	
func _on_HitBox_area_entered(_area):
	var timer = Timer.new()
	timer.set_wait_time(0.25)
	add_child(timer)
	timer.start()
	$AnimatedSprite.play("destroyed")
	yield(timer, "timeout")
	queue_free()
	
func _fire():
	var b = ENEMY_BULLET.instance()
	owner.add_child(b)
	b.transform = $Muzzle.global_transform
	

extends KinematicBody2D

const ENEMY_BULLET = preload("res://src/EnemyBullet.tscn")
onready var raycaster = $PlayerChecker

func _ready():
	$AnimatedSprite.play("idle")

func _physics_process(delta):
	if raycaster.is_colliding():
		_fire()
	
	
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
	

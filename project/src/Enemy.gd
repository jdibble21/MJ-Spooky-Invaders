# Controls player detection, projectile firing, and node destruction
# when hit by player's projectile
extends KinematicBody2D

const ENEMY_BULLET = preload("res://src/EnemyBullet.tscn")

var _fire_delay := 0.0
var _just_fired := false
var _next_fire_time := 1.2

onready var raycaster = $PlayerChecker
onready var _destroyed_sound = $DestroyedSound

func _ready():
	$AnimatedSprite.play("idle")


func _physics_process(_delta):
	if _just_fired:
		_fire_delay = _fire_delay + 0.01
	if raycaster.is_colliding():
		var collide_checker = raycaster.get_collision_point()
		if collide_checker.y < 500:
			return
		if _fire_delay == 0:
			_fire()
			_just_fired = true
		if _fire_delay >= _next_fire_time:
			_fire_delay = 0
			_just_fired = false
	
	
func _on_HitBox_area_entered(area):
	if area.is_in_group("player_bullet"):
		var timer = Timer.new()
		timer.set_wait_time(0.25)
		add_child(timer)
		timer.start()
		$AnimatedSprite.play("destroyed")
		_destroyed_sound.play()
		yield(timer, "timeout")
		queue_free()
	
	
func _fire():
	$FiringSound.play()
	var b = ENEMY_BULLET.instance()
	# get_node is necessary here to avoid null instance errors
	var root_attach = get_tree().get_root().get_node("Level")
	root_attach.add_child(b)
	b.transform = $Muzzle.global_transform
	

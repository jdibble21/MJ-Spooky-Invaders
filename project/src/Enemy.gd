extends KinematicBody2D

onready var raycaster = $PlayerChecker

func _ready():
	$AnimatedSprite.play("idle")

func _physics_process(delta):
	if raycaster.is_colliding():
		print("see player!!")
	
	
func _on_HitBox_area_entered(_area):
	var timer = Timer.new()
	timer.set_wait_time(0.25)
	add_child(timer)
	timer.start()
	$AnimatedSprite.play("destroyed")
	yield(timer, "timeout")
	
	queue_free()

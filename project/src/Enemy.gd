extends KinematicBody2D


func _ready():
	$AnimatedSprite.play("idle")



func _on_HitBox_area_entered(area):
	var timer = Timer.new()
	timer.set_wait_time(0.25)
	add_child(timer)
	timer.start()
	$AnimatedSprite.play("destroyed")
	yield(timer, "timeout")
	
	queue_free()

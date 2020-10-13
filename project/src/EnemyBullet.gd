# Controls player projectile velocity and deletes itself if
# an object is hit or edge of screen is reached
extends Area2D

const SPEED := 500

func _ready():
	$AnimatedSprite.play("firing")
	
func _physics_process(delta):
	position += transform.y * SPEED * delta
	if position.y >= 600:
		print("deleting")
		queue_free()
		

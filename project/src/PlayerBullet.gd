# Controls player projectile velocity and deletes itself if
# an object is hit or edge of screen is reached
extends Area2D

const SPEED := 600

func _ready():
	pass
	
func _physics_process(delta):
	position += transform.y * -SPEED * delta
	if position.y <= 0:
		queue_free()
		

func _on_PlayerBullet_body_entered(body):
	queue_free()
	

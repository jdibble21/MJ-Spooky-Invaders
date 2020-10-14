# Controls player projectile velocity and deletes itself if
# an object is hit or edge of screen is reached
extends Area2D

const SPEED := 150
var _screen_height = ProjectSettings.get_setting("display/window/size/height")

func _ready():
	$AnimatedSprite.play("firing")
	
func _physics_process(delta):
	position += transform.y * SPEED * delta
	if position.y >= _screen_height:
		queue_free()

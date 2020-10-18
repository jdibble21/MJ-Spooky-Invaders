# Controls player projectile velocity and deletes itself if
# an object is hit or edge of screen is reached
extends Area2D

const SPEED := 230

var _screen_height = ProjectSettings.get_setting("display/window/size/height")

func _ready():
	$AnimatedSprite.play("firing")
	
	
func _physics_process(delta):
	position += transform.y * SPEED * delta
	if position.y >= _screen_height:
		queue_free()


func _on_EnemyBullet_body_entered(body):
	if !body.is_in_group("invader"):
		queue_free()


func _on_EnemyBullet_area_entered(area):
	if !area.is_in_group("invader") and !area.is_in_group("player_bullet"):
		queue_free()

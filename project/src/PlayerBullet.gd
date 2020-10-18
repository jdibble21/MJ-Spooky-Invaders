# Controls player projectile velocity and deletes itself if
# an object is hit or edge of screen is reached
extends Area2D

signal hit_enemy
signal hit_bonus_enemy

const SPEED := 600

func _ready():
	pass
	
func _physics_process(delta):
	position += transform.y * -SPEED * delta
	if position.y <= 0:
		queue_free()
		

func _on_PlayerBullet_body_entered(body):
	if body.is_in_group("invader"):
		emit_signal("hit_enemy")
	if body.is_in_group("bonus_enemy"):
		emit_signal("hit_bonus_enemy")
	queue_free()
	


func _on_PlayerBullet_area_entered(area):
	if area.is_in_group("mask_barrier"):
		queue_free()

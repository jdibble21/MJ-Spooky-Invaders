extends KinematicBody2D

signal bonus_destroyed
const SPEED := 200

var _current_pos := Vector2()

func _ready():
	$AnimationPlayer.play("moving_right")
	$AnimatedSprite.play("active")
func _physics_process(delta):
	pass


func _on_HitBox_area_entered(area):
	if area.is_in_group("player_bullet"):
		emit_signal("bonus_destroyed")
		print("BONUS HIT")
		queue_free()


func _on_animation_complete(_anim_name):
	emit_signal("bonus_destroyed")
	print("BONUS SELF DELETE")
	queue_free()

extends Node2D



func _ready():
	$AnimationPlayer.play("logo_fly_in")
	$AnimatedSprite.play("idle")
	$AnimatedSprite2.play("idle")




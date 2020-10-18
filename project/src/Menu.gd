# Handles menu sprites and switching to gameplay scene
extends Node2D

var _gameplay_scene = preload("res://src/Level.tscn")

func _ready():
	$AnimationPlayer.play("logo_fly_in")
	$AnimatedSprite.play("idle")
	$AnimatedSprite2.play("idle")


func _on_PlayButton_pressed():
	queue_free()
	get_tree().get_root().add_child(_gameplay_scene.instance())

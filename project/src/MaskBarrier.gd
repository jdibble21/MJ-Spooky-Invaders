# Handles detection of enemy bullets into barriers, and removes pieces of
# barrier if contact is made
extends Area2D


onready var _left_barrier := $LeftBarrier
onready var _center_barrier := $CenterBarrier
onready var _right_barrier := $RightBarrier

func _on_LeftBarrier_area_entered(area):
	if area.is_in_group("enemy_bullet"):
		$AnimationPlayer.play("left_barrier_destroyed")


func _on_CenterBarrier_area_entered(area):
	if area.is_in_group("enemy_bullet"):
		$AnimationPlayer.play("center_barrier_destroyed")
		

func _on_RightBarrier_area_entered(area):
	if area.is_in_group("enemy_bullet"):
		$AnimationPlayer.play("right_barrier_destroyed")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "left_barrier_destroyed":
		_left_barrier.queue_free()
	if anim_name == "center_barrier_destroyed":
		_center_barrier.queue_free()
	if anim_name == "right_barrier_destroyed":
		_right_barrier.queue_free()

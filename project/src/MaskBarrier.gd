extends Area2D


onready var _left_barrier = $LeftBarrier
onready var _center_barrier = $CenterBarrier
onready var _right_barrier = $RightBarrier



func _on_LeftBarrier_area_entered(area):
	print("Left Area Entered!")


func _on_CenterBarrier_area_entered(area):
	print("Center Area Entered!")


func _on_RightBarrier_area_entered(area):
	print("Right Area Entered!")

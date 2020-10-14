extends Area2D

const ENEMY = preload("res://src/Enemy.tscn")
# Called when the node enters the scene tree for the first time.
onready var _spawn_one = $Spawn1

func _ready():
	var spawn_one_enemy = ENEMY.instance()
	add_child(spawn_one_enemy)
	spawn_one_enemy.position = _spawn_one.position


func _on_Spawn1_area_exited(area):
	var timer = Timer.new()
	timer.set_wait_time(2.2)
	add_child(timer)
	timer.start()
	print("about to respawn spawn1...")
	yield(timer, "timeout")
	var new_enemy = ENEMY.instance()
	add_child(new_enemy)
	new_enemy.position = _spawn_one.position

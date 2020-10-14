# Handle respawning enemies on a timer after previous enemy is destroyed.
# Also gets live spawn coordinates due to enemy movement
extends Area2D

const ENEMY = preload("res://src/Enemy.tscn")

onready var _spawn_one = $Spawn1.position
onready var _spawn_two = $Spawn2.position
onready var _spawn_three = $Spawn3.position
onready var _spawn_four = $Spawn4.position
onready var _spawn_five = $Spawn5.position

func _ready():
	var pos_array = [_spawn_one,_spawn_two,_spawn_three,_spawn_four,_spawn_five]
	for current_pos in pos_array:
		_initial_spawn(current_pos)
	

func _initial_spawn(spawn_position):
		var inst_enemy = ENEMY.instance()
		add_child(inst_enemy)
		inst_enemy.position = spawn_position
		
		
func _on_Spawn1_area_exited(area):
	if !(area.is_in_group("player_bullet")):
		var timer = Timer.new()
		timer.set_wait_time(2.5)
		add_child(timer)
		timer.start()
		print("about to respawn spawn1...")
		yield(timer, "timeout")
		var new_enemy = ENEMY.instance()
		add_child(new_enemy)
		new_enemy.position = _spawn_one


func _on_Spawn2_area_exited(area):
	if !(area.is_in_group("player_bullet")):
		var timer = Timer.new()
		timer.set_wait_time(2.5)
		add_child(timer)
		timer.start()
		print("about to respawn spawn2...")
		yield(timer, "timeout")
		var new_enemy = ENEMY.instance()
		add_child(new_enemy)
		new_enemy.position = _spawn_two


func _on_Spawn3_area_exited(area):
	if !(area.is_in_group("player_bullet")):
		var timer = Timer.new()
		timer.set_wait_time(2.5)
		add_child(timer)
		timer.start()
		print("about to respawn spawn3...")
		yield(timer, "timeout")
		var new_enemy = ENEMY.instance()
		add_child(new_enemy)
		new_enemy.position = _spawn_three


func _on_Spawn4_area_exited(area):
	if !(area.is_in_group("player_bullet")):
		var timer = Timer.new()
		timer.set_wait_time(2.5)
		add_child(timer)
		timer.start()
		print("about to respawn spawn3...")
		yield(timer, "timeout")
		var new_enemy = ENEMY.instance()
		add_child(new_enemy)
		new_enemy.position = _spawn_four


func _on_Spawn5_area_exited(area):
	if !(area.is_in_group("player_bullet")):
		var timer = Timer.new()
		timer.set_wait_time(2.5)
		add_child(timer)
		timer.start()
		print("about to respawn spawn3...")
		yield(timer, "timeout")
		var new_enemy = ENEMY.instance()
		add_child(new_enemy)
		new_enemy.position = _spawn_five

# Spawns initial enemies and handles respawning after a delay when enemies 
# are destroyed. Repeating area_exit functions are necessary to specify unique points
# and enable spawning to be completely separate from each instance
extends Area2D

const ENEMY = preload("res://src/Enemy.tscn")
const BONUS_ENEMY = preload("res://src/BonusEnemy.tscn")
const RESPAWN_DELAY := 2.5
const BONUS_SPAWN_DELAY := 8
const SPEED := 40

var _current_velocity
var _screen_edge_right
var _screen_edge_left 
var _moving_left := true
var _can_spawn_bonus := true
var _bonus_active := false
var _time_elapsed := 0.0

onready var spawn_one = $Spawn1.position
onready var spawn_two = $Spawn2.position
onready var spawn_three = $Spawn3.position
onready var spawn_four = $Spawn4.position
onready var spawn_five = $Spawn5.position
onready var spawn_six = $Spawn6.position
onready var spawn_seven = $Spawn7.position
onready var spawn_eight = $Spawn8.position
onready var spawn_nine = $Spawn9.position
onready var spawn_ten = $Spawn10.position
onready var spawn_eleven = $Spawn11.position
onready var spawn_twelve = $Spawn12.position
onready var spawn_thirteen = $Spawn13.position
onready var spawn_fourteen = $Spawn14.position
onready var spawn_fifteen = $Spawn15.position
onready var spawn_sixteen = $Spawn16.position
onready var bonus_one = $SpawnBonus1.position
onready var bonus_two = $SpawnBonus2.position

func _ready():
	var pos_array = [spawn_one,spawn_two,spawn_three,
	spawn_four,spawn_five, spawn_six, spawn_seven, 
	spawn_eight, spawn_nine, spawn_ten, spawn_eleven,
	 spawn_twelve, spawn_thirteen, spawn_fourteen, 
	spawn_fifteen, spawn_sixteen]
	for current_pos in pos_array:
		_spawn(current_pos)
	_current_velocity = SPEED
	_screen_edge_right = get_viewport().size.x
	_screen_edge_left = -100
	
	
func _physics_process(delta):
	if position.x >= 100:
		_current_velocity = -SPEED
	if position.x <= _screen_edge_left:
		_current_velocity = SPEED
	position += transform.x * _current_velocity * delta
	
	
func _process(_delta):
	if _can_spawn_bonus:
		_bonus_spawn()
	
		
func _spawn(spawn_position):
	var inst_enemy = ENEMY.instance()
	add_child(inst_enemy)
	inst_enemy.position = spawn_position
		
		
func _bonus_spawn():
	_can_spawn_bonus = false
	var timer = Timer.new()
	timer.set_wait_time(BONUS_SPAWN_DELAY)
	add_child(timer)
	timer.start()
	yield(timer, "timeout")
	var new_bonus = BONUS_ENEMY.instance()
	new_bonus.connect("bonus_destroyed",self,"_on_bonus_destroyed")
	add_child(new_bonus)
	
	
func _on_bonus_destroyed():
	_can_spawn_bonus = true
		
		
func _on_Spawn1_area_exited(area):
	if !(area.is_in_group("player_bullet")):
		var timer = Timer.new()
		timer.set_wait_time(RESPAWN_DELAY)
		add_child(timer)
		timer.start()
		yield(timer, "timeout")
		_spawn(spawn_one)


func _on_Spawn2_area_exited(area):
	if !(area.is_in_group("player_bullet")):
		var timer = Timer.new()
		timer.set_wait_time(RESPAWN_DELAY)
		add_child(timer)
		timer.start()
		yield(timer, "timeout")
		_spawn(spawn_two)


func _on_Spawn3_area_exited(area):
	if !(area.is_in_group("player_bullet")):
		var timer = Timer.new()
		timer.set_wait_time(RESPAWN_DELAY)
		add_child(timer)
		timer.start()
		yield(timer, "timeout")
		_spawn(spawn_three)


func _on_Spawn4_area_exited(area):
	if !(area.is_in_group("player_bullet")):
		var timer = Timer.new()
		timer.set_wait_time(RESPAWN_DELAY)
		add_child(timer)
		timer.start()
		yield(timer, "timeout")
		_spawn(spawn_four)


func _on_Spawn5_area_exited(area):
	if !(area.is_in_group("player_bullet")):
		var timer = Timer.new()
		timer.set_wait_time(RESPAWN_DELAY)
		add_child(timer)
		timer.start()
		yield(timer, "timeout")
		_spawn(spawn_five)


func _on_Spawn6_area_exited(area):
	if !(area.is_in_group("player_bullet")):
		var timer = Timer.new()
		timer.set_wait_time(RESPAWN_DELAY)
		add_child(timer)
		timer.start()
		yield(timer, "timeout")
		_spawn(spawn_six)


func _on_Spawn7_area_exited(area):
	if !(area.is_in_group("player_bullet")):
		var timer = Timer.new()
		timer.set_wait_time(RESPAWN_DELAY)
		add_child(timer)
		timer.start()
		yield(timer, "timeout")
		_spawn(spawn_seven)


func _on_Spawn8_area_exited(area):
	if !(area.is_in_group("player_bullet")):
		var timer = Timer.new()
		timer.set_wait_time(RESPAWN_DELAY)
		add_child(timer)
		timer.start()
		yield(timer, "timeout")
		_spawn(spawn_eight)


func _on_Spawn9_area_exited(area):
	if !(area.is_in_group("player_bullet")):
		var timer = Timer.new()
		timer.set_wait_time(RESPAWN_DELAY)
		add_child(timer)
		timer.start()
		yield(timer, "timeout")
		_spawn(spawn_nine)


func _on_Spawn10_area_exited(area):
	if !(area.is_in_group("player_bullet")):
		var timer = Timer.new()
		timer.set_wait_time(RESPAWN_DELAY)
		add_child(timer)
		timer.start()
		yield(timer, "timeout")
		_spawn(spawn_ten)


func _on_Spawn11_area_exited(area):
	if !(area.is_in_group("player_bullet")):
		var timer = Timer.new()
		timer.set_wait_time(RESPAWN_DELAY)
		add_child(timer)
		timer.start()
		yield(timer, "timeout")
		_spawn(spawn_eleven)


func _on_Spawn12_area_exited(area):
	if !(area.is_in_group("player_bullet")):
		var timer = Timer.new()
		timer.set_wait_time(RESPAWN_DELAY)
		add_child(timer)
		timer.start()
		yield(timer, "timeout")
		_spawn(spawn_twelve)


func _on_Spawn13_area_exited(area):
	if !(area.is_in_group("player_bullet")):
		var timer = Timer.new()
		timer.set_wait_time(RESPAWN_DELAY)
		add_child(timer)
		timer.start()
		yield(timer, "timeout")
		_spawn(spawn_thirteen)


func _on_Spawn14_area_exited(area):
	if !(area.is_in_group("player_bullet")):
		var timer = Timer.new()
		timer.set_wait_time(RESPAWN_DELAY)
		add_child(timer)
		timer.start()
		yield(timer, "timeout")
		_spawn(spawn_fourteen)


func _on_Spawn15_area_exited(area):
	if !(area.is_in_group("player_bullet")):
		var timer = Timer.new()
		timer.set_wait_time(RESPAWN_DELAY)
		add_child(timer)
		timer.start()
		yield(timer, "timeout")
		_spawn(spawn_fifteen)


func _on_Spawn16_area_exited(area):
	if !(area.is_in_group("player_bullet")):
		var timer = Timer.new()
		timer.set_wait_time(RESPAWN_DELAY)
		add_child(timer)
		timer.start()
		yield(timer, "timeout")
		_spawn(spawn_sixteen)

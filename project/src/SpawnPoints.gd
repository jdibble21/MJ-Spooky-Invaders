# Spawns initial enemies and handles respawning after a delay when enemies 
# are destroyed

extends Area2D

const ENEMY = preload("res://src/Enemy.tscn")
const BONUS_ENEMY = preload("res://src/BonusEnemy.tscn")
const RESPAWN_DELAY = 2.5
const BONUS_SPAWN_DELAY = 8
const SPEED = 40

var _current_velocity
var _screen_edge_right
var _screen_edge_left 
var _moving_left := true
var _can_spawn_bonus := true
var _bonus_active := false
var _time_elapsed = 0.0

onready var _spawn_one = $Spawn1.position
onready var _spawn_two = $Spawn2.position
onready var _spawn_three = $Spawn3.position
onready var _spawn_four = $Spawn4.position
onready var _spawn_five = $Spawn5.position
onready var _spawn_six = $Spawn6.position
onready var _spawn_seven = $Spawn7.position
onready var _spawn_eight = $Spawn8.position
onready var _bonus_one = $SpawnBonus1.position
onready var _bonus_two = $SpawnBonus2.position

func _ready():
	var pos_array = [_spawn_one,_spawn_two,_spawn_three,
	_spawn_four,_spawn_five, _spawn_six, _spawn_seven, _spawn_eight]
	for current_pos in pos_array:
		_spawn(current_pos)
	_current_velocity = SPEED
	_screen_edge_right = get_viewport().size.x
	_screen_edge_left = 0
	
	
func _physics_process(delta):
	if position.x >= _screen_edge_right/2:
		_current_velocity = -SPEED
	if position.x <= _screen_edge_left:
		_current_velocity = SPEED
	position += transform.x * _current_velocity * delta
	
	
func _process(delta):
	if _can_spawn_bonus:
		_bonus_spawn()
	
		
func _spawn(spawn_position):
	var inst_enemy = ENEMY.instance()
	add_child(inst_enemy)
	inst_enemy.position = spawn_position
		
		
func _bonus_spawn():
	_can_spawn_bonus = false
	var random_spawn = randi()%1+0
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
		_spawn(_spawn_one)


func _on_Spawn2_area_exited(area):
	if !(area.is_in_group("player_bullet")):
		var timer = Timer.new()
		timer.set_wait_time(RESPAWN_DELAY)
		add_child(timer)
		timer.start()
		yield(timer, "timeout")
		_spawn(_spawn_two)


func _on_Spawn3_area_exited(area):
	if !(area.is_in_group("player_bullet")):
		var timer = Timer.new()
		timer.set_wait_time(RESPAWN_DELAY)
		add_child(timer)
		timer.start()
		yield(timer, "timeout")
		_spawn(_spawn_three)


func _on_Spawn4_area_exited(area):
	if !(area.is_in_group("player_bullet")):
		var timer = Timer.new()
		timer.set_wait_time(RESPAWN_DELAY)
		add_child(timer)
		timer.start()
		yield(timer, "timeout")
		_spawn(_spawn_four)


func _on_Spawn5_area_exited(area):
	if !(area.is_in_group("player_bullet")):
		var timer = Timer.new()
		timer.set_wait_time(RESPAWN_DELAY)
		add_child(timer)
		timer.start()
		yield(timer, "timeout")
		_spawn(_spawn_five)


func _on_Spawn6_area_exited(area):
	if !(area.is_in_group("player_bullet")):
		var timer = Timer.new()
		timer.set_wait_time(RESPAWN_DELAY)
		add_child(timer)
		timer.start()
		yield(timer, "timeout")
		_spawn(_spawn_six)


func _on_Spawn7_area_exited(area):
	if !(area.is_in_group("player_bullet")):
		var timer = Timer.new()
		timer.set_wait_time(RESPAWN_DELAY)
		add_child(timer)
		timer.start()
		yield(timer, "timeout")
		_spawn(_spawn_seven)


func _on_Spawn8_area_exited(area):
	if !(area.is_in_group("player_bullet")):
		var timer = Timer.new()
		timer.set_wait_time(RESPAWN_DELAY)
		add_child(timer)
		timer.start()
		yield(timer, "timeout")
		_spawn(_spawn_eight)

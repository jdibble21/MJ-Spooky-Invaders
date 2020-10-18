# Handles global game elements such as music playing, scoring, player 
# defeat and game over
extends Node2D

var _points := 0
var _game_over_state := false

onready var _menu_scene = load("res://src/Menu.tscn")
onready var _gameplay_scene = load("res://src/Level.tscn")
onready var _player := $Player
onready var _spawn_points := $SpawnPoints
onready var _music_loop := $MusicLoop
onready var _HUD_lives_label := $HUD/LivesLabel
onready var _HUD_score_label := $HUD/ScoreLabel
onready var _HUD_gameover_label := $HUD/GameOverLabel
onready var _HUD_restart_label := $HUD/RestartLabel
onready var _HUD := $HUD

func _ready():
	_player.connect("player_defeated",self,"_game_over")
	_player.connect("point_earned",self,"_score")
	_player.connect("bonus_point_earned",self,"_bonus_score")
	_music_loop.play()
	
	
func _process(_delta):
	if !_game_over_state:
		_HUD_lives_label.text = "EXTRA LIVES: " + str($Player.lives - 1)
		_HUD_score_label.text = "SCORE: " + str(_points)
	if Input.is_action_pressed("back_to_menu"):
		queue_free()
		get_tree().get_root().add_child(_menu_scene.instance())
		
		
func _score():
	_points += 2


func _bonus_score():
	_points += 5
	
	
func _game_over():
	_game_over_state = true
	_HUD.set_process(false)
	_HUD_lives_label.text = "EXTRA LIVES: 0" 
	_HUD_gameover_label.show()
	_HUD_restart_label.show()
	_music_loop.stop()

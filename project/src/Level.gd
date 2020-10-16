extends Node2D

onready var _player = $Player
onready var _spawn_points = $SpawnPoints
onready var _music_loop = $MusicLoop
onready var _HUD_lives_label = $HUD/LivesLabel
func _ready():
	# evenutally place fly in animation for enemy spawning here
	_player.connect("player_defeated",self,"_game_over")
	_music_loop.play()
	pass
	
func _process(delta):
	_HUD_lives_label.text = "LIVES: " + str($Player.lives)

func _game_over():
	set_process(false)
	_HUD_lives_label.text = "LIVES: 0" 
	_music_loop.stop()

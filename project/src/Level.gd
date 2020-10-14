extends Node2D


onready var _player = $Player
onready var _spawn_points = $SpawnPoints
onready var _music_loop = $MusicLoop
# Called when the node enters the scene tree for the first time.
func _ready():
	# evenutally place fly in animation for enemy spawning here
	_music_loop.play()
	pass
	
func _process(delta):
	pass



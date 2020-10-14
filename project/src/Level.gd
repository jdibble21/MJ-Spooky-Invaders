extends Node2D

const SPAWN_OBJECT = preload("res://src/SpawnPoints.tscn")

onready var _player = $Player
onready var _spawn_points = $SpawnPoints
# Called when the node enters the scene tree for the first time.
func _ready():
	# evenutally place fly in animation for enemy spawning here
	pass
	
func _process(delta):
	pass



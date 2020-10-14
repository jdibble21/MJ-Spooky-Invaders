extends Node2D

const SPAWN_OBJECT = preload("res://src/SpawnPoints.tscn")

var _spawn_points_dict = {
	"Spawn1": [154, 71],
	"Spawn2": [234, 71],
	"Spawn3": [314, 71],
	"Spawn4": [394, 71]
}

onready var _spawn_points = $SpawnPoints
# Called when the node enters the scene tree for the first time.
func _ready():
	# evenutally place fly in animation for enemy spawning here
	pass
	
func _process(delta):
	pass



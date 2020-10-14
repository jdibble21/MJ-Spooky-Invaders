extends Node2D


var _spawn_points = {
	"Spawn1": [154, 71],
	"Spawn2": [234, 71],
	"Spawn3": [314, 71],
	"Spawn4": [394, 71]
}

# Called when the node enters the scene tree for the first time.
func _ready():
	# evenutally place fly in animation for enemy spawning here
	pass
	
func _process(delta):
	_check_enemy_spawns()
	
func _check_enemy_spawns():
	pass



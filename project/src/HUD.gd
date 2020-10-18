# Handles timer and updating HUD every frame
extends CanvasLayer

var _time := 0.0
var rounded_time

onready var _time_label := $TimeLabel

func _ready():
	$GameOverLabel.hide()
	$RestartLabel.hide()
	
	
func _process(delta):
	_time += delta
	rounded_time = int(_time)
	_time_label.text = "TIME: " + str(rounded_time)

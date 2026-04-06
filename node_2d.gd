extends Node2D
var prevPosx = 16
var prevPosy = 650.0

func _process(delta):
	$Camera2D.position.x += $mainplayer.position.x - prevPosx
	prevPosx = $mainplayer.position.x
	$Camera2D.position.y += $mainplayer.position.y - prevPosy/2
	prevPosy = $mainplayer.position.y

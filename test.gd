extends Node2D
var prevPosx = 16

func _process(delta):
	$Camera2D.position.x += $mainplayer.position.x - prevPosx
	prevPosx = $mainplayer.position.x

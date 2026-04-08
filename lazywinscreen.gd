extends Node2D
@onready var prevPosx = $maincam.position.x

func _process(delta: float) -> void:
	$maincam.position.x += $mainplayer.position.x - prevPosx
	prevPosx = $mainplayer.position.x

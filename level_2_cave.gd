extends Node2D

func _process(_delta):
	$healthLabel.text = "health: %s" % $mainplayer.life
	pass


func _on_mainplayer_dead() -> void:
	get_tree().reload_current_scene()

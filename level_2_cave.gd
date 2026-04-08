extends Node2D

func _process(_delta):
	$healthLabel.text = "health: %s" % $mainplayer.life
	if Input.is_action_just_pressed("restart level"):
		get_tree().reload_current_scene()


func _on_mainplayer_dead() -> void:
	get_tree().reload_current_scene()

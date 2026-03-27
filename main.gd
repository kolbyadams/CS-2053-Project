extends Node2D
var prevPosx = 16

func _process(delta):
	$Camera2D.position.x += $mainplayer.position.x - prevPosx
	prevPosx = $mainplayer.position.x

func _on_character_body_2d_loss():
	get_tree().change_scene_to_file("res://purgatory.tscn") 


func _on_character_body_2d_win():
	get_tree().change_scene_to_file("res://lvl2.tscn") 

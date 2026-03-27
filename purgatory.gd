extends Node2D
var prevPosx = 16
var prevPosy = 16
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Camera2D.position.x += $CharacterBody2D.position.x - prevPosx
	prevPosx = $CharacterBody2D.position.x
	
	$Camera2D.position.y += $CharacterBody2D.position.y - prevPosy
	prevPosy  = $CharacterBody2D.position.y


func _on_character_body_2d_win():
	get_tree().change_scene_to_file("res://main.tscn") 

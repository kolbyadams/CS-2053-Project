extends Node2D
var prevPosx = 16
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Camera2D.position.x += $CharacterBody2D.position.x - prevPosx
	prevPosx = $CharacterBody2D.position.x


func _on_character_body_2d_loss():
	get_tree().reload_current_scene.call_deferred()


func _on_character_body_2d_win():
	get_tree().change_scene_to_file("res://main.tscn") 

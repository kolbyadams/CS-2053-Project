extends Area2D
@export var nextLevel : String #put filepath of next level here

func _on_body_entered(body):
	get_tree().change_scene_to_file(nextLevel) 

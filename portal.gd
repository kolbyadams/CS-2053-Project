extends Area2D

@export var nextLevel: String
#func _on_body_entered(body):
	#if body.name == "mainplayer":
		#get_tree().change_scene_to_file(nextLevel)

func _on_body_entered(body):
	if $"../mainplayer".diamonds_collected >= 3:
		if body.name == "mainplayer":
			if nextLevel != "":
				get_tree().change_scene_to_file(nextLevel)
			else:
				print("LEVEL COMPLETE")

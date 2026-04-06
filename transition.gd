extends ColorRect
func _ready():
	# Plays the animation backward to fade in
	$AnimationPlayer.play("fade")
	
func transition_to(nextLevel : String):
	# Plays the Fade animation and wait until it finishes
	$AnimationPlayer.play_backwards("fade")
	await $AnimationPlayer.animation_finished
	# Changes the scene
	get_tree().change_scene_to_file(nextLevel)

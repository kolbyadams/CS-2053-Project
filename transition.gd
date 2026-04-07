extends ColorRect
func _ready():
	# Plays the animation backward to fade in
	$AnimationPlayer.play("fade")
	
func transition_to(nextLevel : String):
	# Plays the Fade animation and wait until it finishes
	$AnimationPlayer.play_backwards("fade")
	await $AnimationPlayer.animation_finished
	# Changes the scene
	if nextLevel.is_subsequence_of("r"):
		get_tree().reload_current_scene()
	else:
		get_tree().change_scene_to_file(nextLevel)
	
func respawn(body: Node2D, xpos: int, ypos: int):
	$AnimationPlayer.play_backwards("fade")
	await $AnimationPlayer.animation_finished
	body.position = Vector2(xpos, ypos)
	$AnimationPlayer.play("fade")

#doesn't wait because thats how i needed it to happen
func respawnvec(body: Node2D, pos: Vector2):
	$AnimationPlayer.play_backwards("fade")
	body.position = pos
	$AnimationPlayer.play("fade")

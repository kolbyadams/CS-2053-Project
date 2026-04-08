extends Node2D

func _ready() -> void:
	$transition.visible = true

func _process(_delta):
	$Camera2D/healthlabel.text = "health: %s" % $mainplayer.life
	if Input.is_action_just_pressed("restart level"):
		get_tree().reload_current_scene()

func _on_deathbox_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if get_tree().get_nodes_in_group("player").has(body):
		$transition/ColorRect.transition_to("r")


func _on_mainplayer_dead() -> void:
	get_tree().reload_current_scene()

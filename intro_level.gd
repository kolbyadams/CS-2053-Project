extends Node2D

func _ready():
	$transition.visible = true


func _on_deathbox_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if get_tree().get_nodes_in_group("player").has(body):
		$transition/ColorRect.transition_to("r")


func _on_portal_2_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if get_tree().get_nodes_in_group("player").has(body):
		$transition/ColorRect.transition_to("res://Snow_Level/scenes/snow_level.tscn")

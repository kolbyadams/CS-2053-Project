extends Node2D
var prevPosx = 16
var prevPosy = 650.0
@export var nextLevel : String #put filepath of next level here

func _process(delta):
	$Camera2D.position.x += $mainplayer.position.x - prevPosx
	prevPosx = $mainplayer.position.x
	#$Camera2D.position.y += $mainplayer.position.y - prevPosy/2
	#prevPosy = $mainplayer.position.y

func _on_portal_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if get_tree().get_nodes_in_group("player").has(body):
		$Node2D2/ColorRect.transition_to(nextLevel)


func _on_area_2d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	$Node2D2/ColorRect.transition_to("r")

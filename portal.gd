extends Area2D
@export var nextLevel : String #put filepath of next level here

#func _on_body_entered(body):
	#if get_tree().get_nodes_in_group("player").has(body):
		#$ColorRect.transition_to(nextLevel)


#func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	#$ColorRect.transition_to(nextLevel)

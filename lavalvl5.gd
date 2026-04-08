extends Area2D
var respawn: Vector2

func _ready():
	respawn.x = 3514
	respawn.y = 654
func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if get_tree().get_nodes_in_group("player").has(body):
		$"../../transition/ColorRect".respawnvec(body, respawn)


func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if get_tree().get_nodes_in_group("player").has(body):
		$"../../transition/ColorRect".respawnvec(body, respawn)

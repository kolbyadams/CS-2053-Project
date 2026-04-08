extends Area2D
var respawn: Vector2

func _ready():
	respawn.x = 5166.0
	respawn.y = 674.0

func _on_body_entered(body: Node2D) -> void:
	if get_tree().get_nodes_in_group("player").has(body):
		$"../../../transition/ColorRect".respawnvec(body, respawn)
		

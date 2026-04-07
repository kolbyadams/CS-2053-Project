extends Area2D
var respawn: Vector2

func _ready():
	respawn.x = 5213.0
	respawn.y = 696.0

func mover():
	$"../../../mainplayer".position = respawn

func _on_body_entered(body: Node2D) -> void:
	if get_tree().get_nodes_in_group("player").has(body):
		mover()
		

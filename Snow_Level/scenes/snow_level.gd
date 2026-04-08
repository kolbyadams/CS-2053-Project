extends Node2D

@onready var camera = $mainCamera
@onready var screen_1 = $Screen1Pos
@onready var screen_2 = $Screen2Pos
@onready var screen_3 = $Screen3Pos

func _ready():
	camera.global_position = screen_1.global_position

func _on_to_screen_2_body_entered(body):
	if body.name == "mainplayer":
		camera.global_position = screen_2.global_position

func _on_to_screen_3_body_entered(body):
	if body.name == "mainplayer":
		camera.global_position = screen_3.global_position


func _on_portal_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if get_tree().get_nodes_in_group("player").has(body):
		$transition/ColorRect.transition_to("lvl4goeshere")

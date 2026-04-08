extends Node2D
@onready var prevPosx = $maincam.position.x
@onready var prevPosy = $maincam.position.y
@export var nextLevel : String #put filepath of next level here

func _ready():
	$transition.visible = true

func _process(_delta):
	$maincam.position.x += $mainplayer.position.x - prevPosx
	prevPosx = $mainplayer.position.x

#exit portal
func _on_portal_body_shape_entered(_body_rid: RID, body: Node2D, _body_shape_index: int, _local_shape_index: int) -> void:
	if get_tree().get_nodes_in_group("player").has(body):
		$transition/ColorRect.transition_to(nextLevel)

#deathbox
func _on_area_2d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if get_tree().get_nodes_in_group("player").has(body):
		$transition/ColorRect.transition_to("r")

#lvl2 transition
func _on_camtransition_1_body_shape_entered(_body_rid: RID, body: Node2D, _body_shape_index: int, _local_shape_index: int) -> void:
	if get_tree().get_nodes_in_group("player").has(body):
		$lvl2cam.make_current()
		$lvl2.position = Vector2.ZERO
		$lvl1.position = Vector2(10000,10000)
		$lvl1.visible = false
		$lvl2.visible = true
		$lvl1/wall.position = Vector2.ZERO
		$lvl2/wall2.position = Vector2.ZERO

func _on_diamond_2_body_entered(body: Node2D) -> void:
	if get_tree().get_nodes_in_group("player").has(body):
		$maincam.make_current()
		$lvl1.visible = true
		$lvl2.visible = false
		$lvl1.position = Vector2.ZERO

func _on_cp_1_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if get_tree().get_nodes_in_group("player").has(body):
		$transition/ColorRect.respawn(body, 5213.0, 656.0)
		$lvl1.visible = true
		$lvl2.visible = false

func _on_timeleap_1_body_shape_exited(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if get_tree().get_nodes_in_group("player").has(body):
		$lvl1.visible = true
		$lvl2.visible = false
		$lvl2.position = Vector2(10000, 10000)
		$lvl1.position = Vector2.ZERO


func _on_timeleap_2_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if get_tree().get_nodes_in_group("player").has(body):
		$lvl2.position = Vector2.ZERO
		$lvl1.position = Vector2(10000,10000)
		$lvl1.visible = false
		$lvl2.visible = true


func _on_mainplayer_dead() -> void:
	$transition/ColorRect.transition_to("r")


func _on_timeleap_3_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	$lvl1/timeleap3.queue_free()
	$lvl1.visible = false
	$lvl3.visible = true


func _on_timeleap_4_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	$lvl3/timeleap4.queue_free()
	$lvl1.visible = true
	$lvl3.visible = false


func _on_timeleap_5_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	$lvl1/timeleap5.queue_free()
	$lvl1.visible = false
	$lvl3.visible = true

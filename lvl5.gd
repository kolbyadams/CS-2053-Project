extends Node2D
@onready var prevPosx = $level/maincam.position.x
@onready var prevPosy = $level/maincam.position.y
@export var nextLevel : String #put filepath of next level here
func _ready():
	$level/transition.visible = true

func _process(_delta):
	$level/maincam.position.x += $level/mainplayer.position.x - prevPosx
	prevPosx = $level/mainplayer.position.x
	$level/lvl2cam/healthlabel2.text = "health: %s" % $level/mainplayer.life
	$level/maincam/healthlabel1.text = "health: %s" % $level/mainplayer.life
	$level/lvl3cam/healthLabel3.text = "health: %s" % $level/mainplayer.life
	if $level/mainplayer.diamonds_collected >= 3:
		$level/portal2.visible = true
	if Input.is_action_just_pressed("restart level"):
		get_tree().reload_current_scene()
			
#exit portal
func _on_portal_body_shape_entered(_body_rid: RID, body: Node2D, _body_shape_index: int, _local_shape_index: int) -> void:
	if get_tree().get_nodes_in_group("player").has(body):
		$level/transition/ColorRect.transition_to(nextLevel)

#deathbox
func _on_area_2d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if get_tree().get_nodes_in_group("player").has(body):
		$level/transition/ColorRect.transition_to("r")

#lvl2 transition
func _on_camtransition_1_body_shape_entered(_body_rid: RID, body: Node2D, _body_shape_index: int, _local_shape_index: int) -> void:
	if get_tree().get_nodes_in_group("player").has(body):
		$level/maincam.visible = false
		$level/lvl2cam.make_current()
		$level/lvl2.position = Vector2.ZERO
		$level/lvl1.position = Vector2(10000,10000)
		$level/lvl1.visible = false
		$level/lvl2.visible = true
		$level/lvl1/wall.position = Vector2.ZERO
		$level/lvl2/wall2.position = Vector2.ZERO
		$level/wind.stop()
		$level/grass.stop()
		$level/lvl2/lava.play()

func _on_diamond_2_body_entered(body: Node2D) -> void:
	if get_tree().get_nodes_in_group("player").has(body):
		$level/maincam.visible = true
		$level/maincam.make_current()
		$level/lvl1.visible = true
		$level/lvl2.visible = false
		$level/lvl3.visible = false
		$level/lvl1.position = Vector2.ZERO
		$level/lvl1/wall.position = Vector2(5224, -1000)
		$level/lvl2/wall2.position = Vector2(5224, -1000)
		$level/lvl3/wall3.position = Vector2(5224, -1000)
		$level/wind.play()
		$level/grass.play()
		$level/lvl2/lava.stop()
		

func _on_cp_1_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if get_tree().get_nodes_in_group("player").has(body):
		$level/transition/ColorRect.respawn(body, 5213.0, 656.0)
		$level/lvl1.visible = true
		$level/lvl2.visible = false

func _on_timeleap_1_body_shape_exited(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if get_tree().get_nodes_in_group("player").has(body):
		$level/lvl1.visible = true
		$level/lvl2.visible = false
		$level/lvl2.position = Vector2(10000, 10000)
		$level/lvl1.position = Vector2.ZERO
		$level/wind.play()
		$level/grass.play()
		$level/lvl2/lava.stop()

func _on_timeleap_2_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if get_tree().get_nodes_in_group("player").has(body):
		$level/lvl2.position = Vector2.ZERO
		$level/lvl1.position = Vector2(10000,10000)
		$level/lvl1.visible = false
		$level/lvl2.visible = true
		$level/wind.stop()
		$level/grass.stop()
		$level/lvl2/lava.play()


func _on_mainplayer_dead() -> void:
	get_tree().reload_current_scene()


func _on_timeleap_3_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	$level/lvl1/timeleap3.queue_free()
	$level/lvl1.visible = false
	$level/lvl3.visible = true


func _on_timeleap_4_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	$level/lvl3/timeleap4.queue_free()
	$level/lvl1.visible = true
	$level/lvl3.visible = false


func _on_timeleap_5_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	$level/lvl1/timeleap5.queue_free()
	$level/lvl1.visible = false
	$level/lvl3.visible = true
	$level/wind.stop()
	$level/grass.stop()
	$"level/lvl3/harsh wind".play()


func _on_camtransition_2_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if get_tree().get_nodes_in_group("player").has(body):
		$level/maincam.visible = false
		$level/lvl3cam.make_current()
		$level/lvl3.position = Vector2.ZERO
		$level/lvl1.position = Vector2(10000,10000)
		$level/lvl1.position = Vector2(10000,10000)
		$level/lvl1.visible = false
		$level/lvl2.visible = false
		$level/lvl3.visible = true
		$level/lvl1/wall.position = Vector2(5264.0, 0)
		$level/lvl2/wall2.position = Vector2(5264.0, 0)
		$level/lvl3/wall3.position = Vector2(5264.0, 0)


func _on_diamond_4_body_entered(body: Node2D) -> void:
	if body.name == "mainplayer":
		$level/mainplayer.position.x+=1000
		$"level/lvl4/lvl4 cam".make_current()
		$level/lvl1.visible = true
		$level/lvl3cam/healthLabel3.position.x+=1000
		$level/lvl4/lvl4music.play()
		$"level/lvl3/harsh wind".stop()

func _on_diamond_5_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.name == "mainplayer":
		$level/mainplayer.position.x-=1000
		$"level/lvl3cam".make_current()
		$level/lvl1.visible = false
		$level/lvl3cam/healthLabel3.position.x-=1000
		$level/lvl4/lvl4music.stop()
		$"level/lvl3/harsh wind".play()


func _on_restartbox_lvl_4_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if get_tree().get_nodes_in_group("player").has(body):
		$"level/transition/ColorRect".respawn(body,9913.0,503.0)

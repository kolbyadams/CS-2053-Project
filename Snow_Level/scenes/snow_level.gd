extends Node2D

@onready var camera = $mainCamera
@onready var screen_1 = $Screen1Pos
@onready var screen_2 = $Screen2Pos
@onready var screen_3 = $Screen3Pos

func _ready():
	camera.global_position = screen_1.global_position

func _process(_delta):
	$healthlabel.text = "health: %s" % $mainplayer.life
	$healthlabel2.text = "health: %s" % $mainplayer.life
	$healthlabel3.text = "health: %s" % $mainplayer.life
	
func _on_to_screen_2_body_entered(body):
	if body.name == "mainplayer":
		camera.global_position = screen_2.global_position

func _on_to_screen_3_body_entered(body):
	if body.name == "mainplayer":
		camera.global_position = screen_3.global_position


func _on_mainplayer_dead() -> void:
	get_tree().reload_current_scene()
	

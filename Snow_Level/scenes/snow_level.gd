extends Node2D

@onready var camera = $mainCamera
@onready var screen_1 = $Screen1Pos
@onready var screen_2 = $Screen2Pos
@onready var screen_3 = $Screen3Pos

func _ready():
	camera.global_position = screen_1.global_position

func _on_to_screen_2_body_entered(body):
	if body.name == "CharacterBody2D":
		camera.global_position = screen_2.global_position

func _on_to_screen_3_body_entered(body):
	if body.name == "CharacterBody2D":
		camera.global_position = screen_3.global_position

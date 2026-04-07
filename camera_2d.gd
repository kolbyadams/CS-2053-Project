extends Camera2D

@export var player : Node2D
var fixed_y = 0

func _ready():
	fixed_y = global_position.y

func _process(delta):
	if player:
		global_position.x = player.global_position.x
		global_position.y = fixed_y

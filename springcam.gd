extends Camera2D
@export var target : Node2D
var springConstant = 100
var dampConstant

var actualPosition
var velocity

func _ready():
	dampConstant = 3.0 * sqrt(springConstant)
	offset = position - target.position
	actualPosition = position
	velocity = Vector2.ZERO

func _process(delta):
	var idealPosition = target.position + offset
	var displacement = actualPosition - idealPosition
	var springAccel = (-springConstant * displacement) - (dampConstant * velocity)
	velocity += springAccel * delta
	actualPosition += velocity * delta
	position = actualPosition

extends CharacterBody2D

@export var speed: float = 60.0
@export var gravity: float = 1200.0

var direction := -1

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta

	velocity.x = direction * speed
	move_and_slide()

	if is_on_wall():
		direction *= -1
		$Sprite2D.flip_h = direction > 0

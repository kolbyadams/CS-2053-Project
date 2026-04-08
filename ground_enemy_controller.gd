extends CharacterBody2D
var health = 3.0
var paused = false

@export var speed: float = 60.0
@export var gravity: float = 1200.0

var direction := -1

func _physics_process(delta: float) -> void:
	if not paused:
		if not is_on_floor():
			velocity.y += gravity * delta
		if is_on_wall() or (is_on_floor() and !$RayCast2D.is_colliding()):
			direction *= -1
			$Sprite2D.flip_h = direction > 0
			$RayCast2D.position.x *= -1.0
		velocity.x = direction * speed
		move_and_slide()
			
		if health < 1:
			queue_free()
func take_damage(damage: float):
	health -= damage
	print(health)

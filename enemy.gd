extends CharacterBody2D

var health = 3
var knockback = Vector2.ZERO

func _physics_process(delta):
	velocity = knockback
	move_and_slide()
	knockback = knockback.move_toward(Vector2.ZERO, 800 * delta)

func take_damage(amount, dir):
	health -= amount
	knockback = dir.normalized() * 250
	
	if health <= 0:
		queue_free()

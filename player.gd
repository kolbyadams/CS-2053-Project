extends CharacterBody2D
signal dead
var life = 3.0
var coyote = false
var coyoteTimer = 0
var speed = 0
var diamonds_collected = 0

@export var coyoteTimeMax = 6
@export var maxWalkSpeed = 100
@export var acceleration = 20
@export var jumpVelocity = -300.0

var last_dir = Vector2.RIGHT
var is_attacking = false

@onready var attack_area = $AttackArea
@onready var attack_shape = $AttackArea/CollisionShape2D
@onready var slash_sprite = $AttackArea/SlashSprite

func _ready():
	attack_shape.disabled = true
	attack_area.body_entered.connect(_on_attack_area_body_entered)
	slash_sprite.visible = false

func _physics_process(delta):
		if not is_on_floor():
			coyoteTimer += 1
			velocity += get_gravity() * delta
			$AnimatedSprite2D.animation = "jump"
		else:
			coyoteTimer = 0	

		if Input.is_action_pressed("jump") and (is_on_floor() or coyoteTimer < coyoteTimeMax):
			velocity.y = jumpVelocity
			$AnimatedSprite2D.animation = "jump"
			$walk.playing = false
			$run.playing = false
			$jump.play()

		if Input.is_action_just_released("jump") and velocity.y < jumpVelocity / 2:
			velocity.y = jumpVelocity / 2

		if Input.is_action_pressed("sprint"):
			speed = move_toward(speed, maxWalkSpeed * 2, acceleration)
		else:
			speed = move_toward(speed, maxWalkSpeed, acceleration)

		var direction = Input.get_axis("left", "right")

		if direction != 0:
			velocity.x = direction * speed
			last_dir = Vector2(direction, 0)
		else:
			velocity.x = move_toward(velocity.x, 0, 50)
			speed = 0

		if Input.is_action_just_pressed("attack") and !is_attacking:
			attack()
			$slash.play()

		
		if direction < 0:
			if is_on_floor():
				if Input.is_action_pressed("sprint"):
					$AnimatedSprite2D.animation = "run"
					if not $run.playing:
						$run.play()
				else:
					$AnimatedSprite2D.animation = "walk"
					if not $walk.playing:
						$walk.play()
			$AnimatedSprite2D.flip_h = true
		elif direction > 0:
			if is_on_floor():
				if Input.is_action_pressed("sprint"):
					$AnimatedSprite2D.animation = "run"
					if not $run.playing:
							$run.play()
				else:
					$AnimatedSprite2D.animation = "walk"
					if not $walk.playing:
						$walk.play()
			$AnimatedSprite2D.flip_h = false
		elif is_on_floor():
			$AnimatedSprite2D.animation = "stand"
			
		$AnimatedSprite2D.play()

		if diamonds_collected >= 3:
			get_parent().get_node("portal").visible = true
		
		move_and_slide()
		if life <= 0:
			dead.emit()

func attack():
		is_attacking = true
		attack_shape.disabled = false
		slash_sprite.visible = true

		var attack_distance = 35

		if last_dir.x > 0:
			attack_area.position = Vector2(attack_distance, 0)
			slash_sprite.flip_h = false
		else:
			attack_area.position = Vector2(-attack_distance, 0)
			slash_sprite.flip_h = true

		await get_tree().create_timer(0.15).timeout

		attack_shape.disabled = true
		slash_sprite.visible = false
		is_attacking = false

func _on_attack_area_body_entered(body):
	if body is CharacterBody2D and not body.name == "mainplayer":
		body.take_damage(1)

func _on_diamond_1_body_entered(body: Node2D) -> void:
	if body.name == "mainplayer":
		queue_free()

func _on_hurtbox_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.name.contains("Enemy"):
		life -= 0.5

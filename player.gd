extends CharacterBody2D
var life = 3
var coyote = false #whether you are within coyote time or not after leaving a ledge
var coyoteTimer = 0 #in frames
var speed = 0
#exported for easy editing
@export var coyoteTimeMax = 6 #in frames
@export var maxWalkSpeed = 100
@export var acceleration = 20
@export var jumpVelocity = -300.0

#TODO:add taking damage, depending on how we end up doing that


func _physics_process(delta):
	#gravity and coyote timing
	if not is_on_floor():
		coyoteTimer+=1
		velocity += get_gravity() * delta
		$AnimatedSprite2D.animation = "jump"
	else:
		coyoteTimer = 0
		
	#jump
	if Input.is_action_pressed("jump") and (is_on_floor() or coyoteTimer < coyoteTimeMax):
		velocity.y = jumpVelocity
		$AnimatedSprite2D.animation = "jump"
	if Input.is_action_just_released("jump") and velocity.y < jumpVelocity/2:
		velocity.y = jumpVelocity/2
		
	#speed acceleration / deceleration for sprint
	if Input.is_action_pressed("sprint"):
		speed = move_toward(speed, maxWalkSpeed*2, acceleration)
	else:
		speed = move_toward(speed, maxWalkSpeed, acceleration)
		
	#basic movement and desceleration
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * move_toward(speed, maxWalkSpeed, acceleration)
	else:
		velocity.x = move_toward(velocity.x, 0, 50)
		speed = 0
		
	#placeholder sprite animation
	if direction < 0:
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_h = true
	elif direction > 0: 
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_h = false
	else:
		$AnimatedSprite2D.animation = "stand"
		 
	$AnimatedSprite2D.play()
	move_and_slide()

 

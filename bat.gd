extends CharacterBody2D

enum State{
	idle,
	chasing,
	returning
}

@export var speed = 100
@export var chase_range = 125

@onready var anim = $AnimatedSprite2D # easier tan calling $AnimatedSpriet2D each time
@onready var nav_agent = $NavigationAgent2D
@export var mainplayer: CharacterBody2D

var state = State.idle
var home_position

func _ready():
	print(nav_agent)
	home_position = global_position
	
func _physics_process(delta: float) -> void:
	match state:
		State.idle:
			idle_state()
		State.chasing:
			chasing_state()
		State.returning:
			returning_state()
	
	move_along_path(delta)
	check_transitions()
	
#states

func idle_state():
	play_anim("idle")
	velocity = Vector2.ZERO
	
func chasing_state():
	play_anim("flying")
	nav_agent.target_position = mainplayer.global_position

func returning_state():
	play_anim("flying")
	nav_agent.target_position = home_position

#movement

func move_along_path(delta):
	if nav_agent.is_navigation_finished():
		velocity = Vector2.ZERO
		return
	
	var next_point = nav_agent.get_next_path_position()
	var direction = (next_point - global_position).normalized() #ooh we normalizing
	velocity = direction * speed
	
	if(velocity.x != 0):
		anim.flip_h = velocity.x < 0
	
	move_and_slide()
	
#transitions between states

func check_transitions():
	var dist_to_player = global_position.distance_to(mainplayer.global_position)
	
	match state:
		State.idle:
			if dist_to_player < chase_range:
				state = State.chasing
		State.chasing:
			if dist_to_player > chase_range:
				state = State.returning
		State.returning:
			if global_position.distance_to(home_position) < 10:
				state = State.idle
				
# animation

func play_anim(name):
	if anim.animation != name:
		anim.play(name)

extends CharacterBody2D

"""
Character movement script.

Handles movement, jumping, and dashing.

We also set player's constant variables
here.
"""

var speed = 75


var direction = 0.0


var jump = 300


var temp_speed_multiplier = 1.0


const gravity = 20


const JUMP_VELOCITY = -300.0


const dashspeed = 300


const dashlenght = 1


@onready var anim = $AnimatedSprite2D
"""
Animation node.
"""

@onready var sprite = $AnimatedSprite2D
"""
Sprite node.
"""

func _physics_process(_delta):
	"""
	Handles movement and jumping.
	"""
	
	direction = Input.get_axis("ui_left","ui_right")
	velocity.x = direction * speed * temp_speed_multiplier
	
	if Input.is_action_pressed("ui_up"):
		temp_speed_multiplier = 4.0
	else:
		temp_speed_multiplier = 1.0
	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	if direction != 0:
		anim.play ("Arun")
	else: 
		anim.play ("Aidle")
	
	sprite.flip_h = direction < 0 if direction != 0 else sprite.flip_h
	
	while is_on_floor() and Input.is_action_pressed("ui_up"):
		anim.play ("Ajump")
		velocity.y -= jump * temp_speed_multiplier
	
	if !is_on_floor(): 
		velocity.y += gravity
		anim.play ("Afall")
	
	move_and_slide()

extends CharacterBody2D

@onready var anim = $AnimatedSprite2D
@onready var sprite = $AnimatedSprite2D

var speed = 100

func _physics_process(_delta):
	if Input.is_action_just_pressed("ui_left"):
		Timer.start
		speed = -1000
		
		

	if Input.is_action_just_pressed("ui_right"): 
		speed = 1000
		
		

	var direction = Input.get_axis("ui_left","ui_right")
	velocity.x = direction * speed
	speed = 300
	
	if !Input.get_axis("ui_left","ui_right"):
		anim.play ("A")
	if velocity.x > 0:
		anim.play ("A Rdodge")
	if velocity.x < 0:
		anim.play ("A Ldodge")
	
	move_and_slide()


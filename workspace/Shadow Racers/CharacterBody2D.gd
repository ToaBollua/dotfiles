extends CharacterBody2D

"""

This script handles the player movement and it's animation.

It assumes that the player node has an AnimatedSprite2D child node.
It detects user input using the gdscript's input method
(Customizable via Godot's GUI) to move the player and
animate them.

"""

@onready var anim = $AnimatedSprite2D
@onready var sprite = $AnimatedSprite2D

var speed = 100


"""

This functon and it's
processes are used to check the user's
input and make the player's character
react to them as it needs, according to
already defined physics and speed variables.

"""
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


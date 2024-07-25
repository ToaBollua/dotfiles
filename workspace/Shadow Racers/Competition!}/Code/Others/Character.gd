extends CharacterBody2D

"""

This script here makes the logic
for the player to move around the map
and interact with the environment,
adjusting it's movement and jump
speed.

(Might delete)

"""

const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta):

	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

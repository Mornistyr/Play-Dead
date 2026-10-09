extends CharacterBody2D
@onready var sprite: AnimatedSprite2D = $Sprite2D

@export var speed = 3.5

func _physics_process(delta):
	if Input.is_action_pressed("move up"):
		velocity.y = -1
	elif Input.is_action_pressed("move down"):
		velocity.y = 1
	else:
		velocity.y = 0
	
	if Input.is_action_pressed("move left"):
		velocity.x = -1
	elif Input.is_action_pressed("move right"):
		velocity.x = 1
	else: 
		velocity.x = 0
	
	velocity = velocity.normalized() * speed
	move_and_collide(velocity)
	
	#animations
	if velocity.y == 0 and velocity.x == 0:
		sprite.play("Idle")
	if Input.is_action_pressed("move right"):
		sprite.play("Walking")
		sprite.flip_h = false
	if Input.is_action_pressed("move left"):
		sprite.play("Walking")
		sprite.flip_h = true

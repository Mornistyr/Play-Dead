extends CharacterBody2D
@onready var sprite: AnimatedSprite2D = $Sprite2D
var health: int = 100

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

	if Input.is_anything_pressed() == false:
		sprite.play("Idle")
	if Input.is_action_pressed("move right"):
		sprite.play("Walking")
		sprite.flip_h = false
	if Input.is_action_pressed("move left"):
		sprite.play("Walking")
		sprite.flip_h = true
	if Input.is_action_pressed("move up"):
		sprite.play("Walking")
	if Input.is_action_pressed("move down"):
		sprite.play("Walking")
		
	if Input.is_action_pressed("playdead"):
		sprite.play("Dead")
		
#Health



func _on_hitbox_body_entered(body: Node2D) -> void:
	if body.name == "Snake": 
		health -= 25
		print(health)
		
	if health == 0:
		print("died")

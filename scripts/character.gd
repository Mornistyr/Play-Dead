extends CharacterBody2D
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
var is_moving: bool

const SPEED = 150.0
const JUMP_VELOCITY = -250.0


func _ready() -> void:
	GameState.died.connect(_on_died)
	animation_player.animation_finished.connect(_on_animation_finished)

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move left", "move right")
	if direction:
		print(direction)
		velocity.x = direction * SPEED
		is_moving = true
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		is_moving =  false
	if is_moving:
		animated_sprite.play("walking")
		GameState.player_position = position
	else:
		animated_sprite.play("Idle")
		
	if direction == -1:
		animated_sprite.flip_h = true
	if direction == 1:
		animated_sprite.flip_h = false

	move_and_slide()
	


func _on_died():
	animation_player.play("die")
	
func _on_animation_finished(anim_name):
	if anim_name == "die":
		queue_free()

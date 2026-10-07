extends Sprite2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@export var speed: int = 1

var direction : String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	audio_stream_player_2d.play() # Replace with function body.
	direction = "Right"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if position.x == 500:
		direction = "Left"
	if position.x == -500:
		direction = "Right"
	
	if direction == "Left":
		move_left()
	if direction == "Right":
		move_right()
	
	
func move_left():
	position.x -= speed 
	print("moving left %s" %position.x)
	
func move_right():
	position.x += speed
	print("moving right %s" %position.x)

	

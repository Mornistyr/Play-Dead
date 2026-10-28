extends CharacterBody2D
class_name Snake
@onready var player_test: CharacterBody2D = $"."



@export var SPEED: float = 50.0

var home_position : Vector2 = Vector2.ZERO
var attack_target : CharacterBody2D

enum TARGET {
	NULL,
	LOST,
	FOUND
}

var target : TARGET


func _ready() -> void:
	home_position = position
	GameState.died.connect(_on_player_died)

func _physics_process(delta: float) -> void:
	match target:
		TARGET.NULL:
			pass
		TARGET.LOST:
			_go_home(delta)
		TARGET.FOUND:
			_attack(delta)
	




func _attack(delta: float) -> void:
	var direction = (attack_target.position - position).normalized()
	position += direction * SPEED * delta 
	if direction.x > 0:
		$Sprite2D.flip_h = true
	if direction.x < 0:
		$Sprite2D.flip_h = false

func _on_sight_body_entered(body: Node2D) -> void:
	if body.name == "Player Test" and !body.is_playing_dead:
		attack_target = body
		target = TARGET.FOUND
		$Timer.stop()


func _on_sight_body_exited(body: Node2D) -> void:
	if body.name == "Player Test":
		$Timer.start()


func _on_timer_timeout() -> void:
	target = TARGET.LOST
	
func _go_home(delta) -> void:
	var direction = (home_position - position).normalized()
	position += direction * (SPEED/2) * delta
	if position == home_position:
		target = TARGET.NULL
		
func _on_player_died():
	target = TARGET.LOST

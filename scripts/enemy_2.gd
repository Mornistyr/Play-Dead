extends CharacterBody2D
@onready var player_test: CharacterBody2D = $"."


const SPEED = 50.0


var target = null

func _physics_process(delta: float) -> void:
	if target:
		_attack(delta)




func _attack(delta: float) -> void:
	var direction = (target.position - position).normalized()
	position += direction * SPEED * delta 
	

func _on_sight_body_entered(body: Node2D) -> void:
	if body.name == "Player Test":
		target = body
		print(target)


func _on_sight_body_exited(body: Node2D) -> void:
	if body.name == "Player Test":
		target = null

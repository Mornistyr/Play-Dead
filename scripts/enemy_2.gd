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
		$Timer.stop()
		print("timer stopped 2")


func _on_sight_body_exited(body: Node2D) -> void:
	if body.name == "Player Test":
		$Timer.start()
		print("timer started")


func _on_timer_timeout() -> void:
	print("timer stopped")
	target = null

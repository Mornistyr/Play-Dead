extends Area2D

var currency: int = 0 



func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player Test":
		currency += 1 
		queue_free()
		print(currency)

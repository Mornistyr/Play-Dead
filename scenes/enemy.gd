class_name Fox extends CharacterBody2D

@export var speed: float = 50
@onready var area_2d: Area2D = $Area2D



func _ready() -> void:
	area_2d.area_entered.connect(_on_area_entered)
	
func _physics_process(_delta: float) -> void:
	if true: ##TODO Add rythm logic
		var player_direction: Vector2 = (GameState.player_position - position).normalized()
		velocity.x = player_direction.x * speed
		move_and_slide()
	pass


func _on_area_entered(area : Area2D):
	if area.is_in_group("Player Area"):
		GameState.died.emit()

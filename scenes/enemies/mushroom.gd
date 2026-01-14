extends CharacterBody2D

@export var SPEED = 30

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	velocity = Vector2(0, -30)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	handle_movement()

func handle_movement() -> void:
	var collision_info = move_and_collide(velocity)
	if collision_info:
		handle_collision(collision_info)
		
func handle_collision(collision_info : KinematicCollision2D) -> void:
	var collision_point = collision_info.get_position()
	print(collision_point)

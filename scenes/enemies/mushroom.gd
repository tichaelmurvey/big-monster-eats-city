extends CharacterBody2D

@export var SPEED = 150
@export var ACCEL = 800

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	velocity = Vector2(0, -10)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	#update velocity (this is just for testing, pathfinding will take over this part!)
	velocity.y += -ACCEL*delta
	velocity = velocity.limit_length(SPEED)
	
	handle_movement(delta)

#Move enemy and register collisions
func handle_movement(delta: float) -> void:
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		handle_collision(collision_info)

#handle collision
func handle_collision(collision_info : KinematicCollision2D) -> void:
	var hit_obj = collision_info.get_collider()
	
	#deal 1 damage to whatever it hit 
	hit_obj.get_hit(1) 
	# ^ nb this isn't very safe, trusts get_hit exists
	#bounce off (TODO: post-hit dmg cooldown)
	velocity = velocity.bounce(collision_info.get_normal())

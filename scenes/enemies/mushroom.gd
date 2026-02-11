extends CharacterBody2D

@export var SPEED = 100
@export var ACCEL = 800
var target : Building

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	velocity = Vector2(0, -10)
	choose_target()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if target:
		velocity += position.direction_to(target.position)*ACCEL*delta
	else:
		velocity.y += -ACCEL*delta
	
	velocity = velocity.limit_length(SPEED)
	
	handle_movement(delta)

func is_building(obj : Node):
	return obj is Building and not obj.destroyed

func choose_target():
	target = null
	var targetable_buildings = GameEnv.buildings.get_children().filter(is_building)
	
	if targetable_buildings.size() == 0:
		return
	
	var possible_target = targetable_buildings.pick_random()
	
	if possible_target is not Building:
		choose_target()
		return
	
	if possible_target.destroyed:
		choose_target()
		return
	
	else:
		target = possible_target
		target.on_destroyed.connect(choose_target)

#Move enemy and register collisions
func handle_movement(delta: float) -> void:
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		handle_collision(collision_info)

#handle collision
func handle_collision(collision_info : KinematicCollision2D) -> void:
	var hit_obj = collision_info.get_collider()
	
	if hit_obj.is_in_group("damageable"):
		# deal 1 damage to whatever it hit
		hit_obj.get_hit(1)

	#bounce off (TODO: post-hit dmg cooldown)
	velocity = velocity.bounce(collision_info.get_normal())

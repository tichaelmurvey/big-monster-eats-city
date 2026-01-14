extends StaticBody2D
@export var hit_points = 10
@export var destroyed = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func get_hit(dmg : float) -> void:
	hit_points -= dmg
	if hit_points <= 0:
		hit_points = 0
		destroyed = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

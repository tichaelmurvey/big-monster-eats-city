extends StaticBody2D
@export var hit_points = 10
@export var destroyed = false
var destroyed_building = load("res://assets/building_destroyed.tres")

func get_hit(dmg : float) -> void:
	hit_points -= dmg
	if hit_points <= 0:
		hit_points = 0
		destroyed = true
		#TODO: Add more visual stages of building damage
		$original.visible = false
		$destroyed.visible = true
		#removes self from all collision layers. IMPORTANT: this is bitmap, not integer of layer
		collision_layer = 0

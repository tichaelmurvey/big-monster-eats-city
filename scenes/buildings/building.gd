extends StaticBody2D
class_name Building
@export var hit_points = 10
@export var destroyed = false
@export var resource : String
@export var resource_amt = 1
var destroyed_building = load("res://assets/building_destroyed.tres")

func _ready() -> void:
	print(name, hit_points, resource, resource_amt)

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


func _on_resource_timer_timeout() -> void:
	if resource != "" && !destroyed:
		GameEnv[resource] += resource_amt

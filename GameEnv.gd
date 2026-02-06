extends Node

const GRID_SCALE: float = 24.0

var money = 1000
var citizens = 1000
var engineers = 100

var prices = {}

var hovering = false

@onready var buildings : Node2D = get_node("/root/game/buildings")

func place_building(building_scene : PackedScene, global_position: Vector2, building_name : String) -> void:

	if prices[building_name] == null:
		print("No price for building", building_name);
		return;

	if prices[building_name] > money:
		return;

	money -= prices[building_name]

	var building = building_scene.instantiate()
	building.global_position = global_position
	buildings.add_child(building)

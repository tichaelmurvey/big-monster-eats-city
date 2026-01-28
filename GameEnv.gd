extends Node
var money = 1000
var citizens = 1000
var engineers = 100
var hovering = false

@onready var buildings : Node2D = get_node("/root/game/buildings")

func place_building(building_scene : PackedScene, global_position: Vector2) -> void:
	var building = building_scene.instantiate()
	building.global_position = global_position
	buildings.add_child(building)

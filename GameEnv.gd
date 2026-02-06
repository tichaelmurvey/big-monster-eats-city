extends Node
var money = 1000
var citizens = 1000
var engineers = 100


var hovering = false

@onready var buildings : Node2D = get_node("/root/game/buildings")

func place_building(building : Building) -> void:
    var global_pos = building.global_position

    if building.get_parent():
        building.get_parent().remove_child(building)
    buildings.add_child(building)
    building.global_position = global_pos
extends Node2D
class_name HoverManager

var placeable : Building

func set_hover(scene : PackedScene):
	position = get_local_mouse_position()
	placeable = scene.instantiate()
	add_child(placeable)
	GameEnv.hovering = true

func _input(event):
	if GameEnv.hovering:
		# Mouse in viewport coordinates.
		if event is InputEventMouseButton:
			GameEnv.place_building(placeable)
			GameEnv.hovering = false
		if event is InputEventMouseMotion:
			position = event.position

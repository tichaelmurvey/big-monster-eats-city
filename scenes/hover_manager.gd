extends Node2D
class_name HoverManager

var placeable : Building
var building_scene : PackedScene

func set_hover(scene : PackedScene):
	position = get_local_mouse_position()
	building_scene = scene

	placeable = scene.instantiate()
	add_child(placeable)
	GameEnv.hovering = true

func _input(event):
	if GameEnv.hovering:
		if event is InputEventMouseMotion:
			position = event.position

		# Mouse in viewport coordinates.
		if event is InputEventMouseButton:
			if event.button_index == MouseButton.MOUSE_BUTTON_LEFT:
				GameEnv.place_building(building_scene, global_position)
			elif event.button_index == MouseButton.MOUSE_BUTTON_RIGHT:
				placeable.queue_free()
				GameEnv.hovering = false

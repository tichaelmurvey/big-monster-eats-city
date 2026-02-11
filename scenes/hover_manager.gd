extends Node2D
class_name HoverManager

var placeable : Building
var building_scene : PackedScene
var building_name : String

func set_hover(scene : PackedScene, input_name : String):
	position = get_local_mouse_position()
	building_scene = scene
	building_name = input_name
	placeable = scene.instantiate()
	placeable.set_collision_layer_value(1, false)
	placeable.set_collision_mask_value(1, false)
	add_child(placeable)
	GameEnv.hovering = true

func _input(event):
	if GameEnv.hovering:
		if event is InputEventMouseMotion:
			var grid_position = (event.position / GameEnv.GRID_SCALE).round()
			position = grid_position * GameEnv.GRID_SCALE

		# Mouse in viewport coordinates.
		if event is InputEventMouseButton and not event.pressed:
			if placeable.overlap_detector.has_overlapping_areas():
				print("something is already here!")
				return
			if event.button_index == MouseButton.MOUSE_BUTTON_LEFT:
				GameEnv.place_building(building_scene, global_position, building_name)
			elif event.button_index == MouseButton.MOUSE_BUTTON_RIGHT:
				placeable.queue_free()
				GameEnv.hovering = false

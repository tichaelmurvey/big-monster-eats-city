extends Node2D

var placeable : Building

func set_hover(scene : PackedScene):
	placeable = scene.instantiate()
	add_child(placeable)
	GameEnv.hovering = true

func _input(event):
	if GameEnv.hovering:
		# Mouse in viewport coordinates.
		if event is InputEventMouseButton:
			GameEnv.hovering = false
			do_placement(event.position)
		elif event is InputEventMouseMotion:
			position = event.position
func do_placement(pos):
	pass

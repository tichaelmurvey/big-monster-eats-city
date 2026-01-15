extends TextureButton

@export var hover_manager : Node2D
@export var building_scene : PackedScene

func _on_pressed() -> void:
	hover_manager.set_hover(building_scene)

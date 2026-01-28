extends TextureButton

@export var hover_manager : HoverManager
@export var building_scene : PackedScene
@export var cost : int = 100

func _ready() -> void:
    $PanelContainer/cost.text = str(cost)

func _on_pressed() -> void:
    hover_manager.set_hover(building_scene)

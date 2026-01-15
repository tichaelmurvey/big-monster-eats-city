extends RichTextLabel
@export var currency_type = "money"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text = currency_type.capitalize() + ": " + str(GameEnv[currency_type])

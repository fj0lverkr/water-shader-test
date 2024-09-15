extends Sprite2D

const P_COLOR: String = "replacement_color"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalBus.on_colorpicker_updated.connect(_on_colorpicker_updated)


func _on_colorpicker_updated(color: Color) -> void:
	material.set_shader_parameter(P_COLOR, color)

@tool
extends Sprite2D

const RATIO: String = "aspect_ratio"


func _on_item_rect_changed() -> void:
	material.set_shader_parameter(RATIO, scale.y / scale.x)
	$Label.text = material.get_shader_parameter(RATIO)

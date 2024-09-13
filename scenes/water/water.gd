@tool
extends Sprite2D

const RATIO: String = "aspect_ratio"
const AMP: String = "_amplitude"
const TILING: String = "_tiled_factor"
const OFFSET: String = "_offset_factor"
const TIME: String = "_time_scale"

@export
var _tiled_factor: Vector2 = Vector2(5.0, 5.0)
@export
var _amplitude: Vector2 = Vector2(0.05, 0.1)
@export
var _offset_factor: Vector2 = Vector2(2.0, 2.0)
@export
var _time_scale: Vector2 = Vector2(1.0, 1.0)


func _ready() -> void:
	print(material.get_shader_parameter(TIME))
	material.set_shader_parameter(AMP, _amplitude)
	material.set_shader_parameter(TILING, _tiled_factor)
	material.set_shader_parameter(OFFSET, _offset_factor)
	material.set_shader_parameter(TIME, _time_scale)
	print(material.get_shader_parameter(TIME))


func _on_item_rect_changed() -> void:
	material.set_shader_parameter(RATIO, scale.y / scale.x)

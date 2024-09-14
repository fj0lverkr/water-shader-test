@tool
class_name WaterShader
extends Sprite2D

const RATIO: String = "aspect_ratio"
const AMP: String = "amplitude"
const TILING: String = "tiled_factor"
const OFFSET: String = "offset_factor"
const TIME: String = "time_scale"

signal export_value_changed(name: String, value: Vector2)

@export
var tiled_factor: Vector2 = Vector2(5.0, 5.0):
	set(v):
		tiled_factor = v
		export_value_changed.emit(TILING, v)

@export
var amplitude: Vector2 = Vector2(0.05, 0.1):
	set(v):
		amplitude = v
		export_value_changed.emit(AMP, v)

@export
var offset_factor: Vector2 = Vector2(2.0, 2.0):
	set(v):
		offset_factor = v
		export_value_changed.emit(OFFSET, v)

@export
var time_scale: Vector2 = Vector2(1.0, 1.0):
	set(v):
		time_scale = v
		export_value_changed.emit(TIME, v)


func _ready() -> void:
	if Engine.is_editor_hint():
		export_value_changed.connect(_on_export_value_changed)
	else:
		material.set_shader_parameter(AMP, amplitude)
		material.set_shader_parameter(TILING, tiled_factor)
		material.set_shader_parameter(OFFSET, offset_factor)
		material.set_shader_parameter(TIME, time_scale)


func _on_item_rect_changed() -> void:
	material.set_shader_parameter(RATIO, scale.y / scale.x)


func _on_export_value_changed(param_name: String, value: Vector2) -> void:
	print(material.get_shader_parameter(param_name))
	material.set_shader_parameter(param_name, value)
	print(material.get_shader_parameter(param_name))

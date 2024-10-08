extends Node2D

@onready
var fps_label: Label = $Label

var _initial_text: String


func _ready() -> void:
	_initial_text = fps_label.text


func _process(_delta: float) -> void:
	fps_label.text = _initial_text + str(Engine.get_frames_per_second())


func _on_color_picker_color_changed(color: Color) -> void:
	SignalBus.on_colorpicker_updated.emit(color)

extends CanvasLayer

@onready var rect = $ColorRect
var material: ShaderMaterial

func _ready() -> void:
	material = rect.material
	rect.size = get_viewport().size

func transition_to_scene(path: String) -> void:
	# close in (black circle shrinks in, covering screen)
	var tween = create_tween()
	tween.tween_property(material, "shader_parameter/radius", 0.0, 1)
	await tween.finished

	get_tree().change_scene_to_file(path)

	# open up (circle expands, revealing new scene)
	var tween2 = create_tween()
	tween2.tween_property(material, "shader_parameter/radius", 1.5, 1)

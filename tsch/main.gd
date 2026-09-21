extends Node2D

@onready var light = $ColorRect
@onready var label = $Button

var mainC = Color('#ffffff64')
var selectC = Color('#ffff7164')


var orangeL = Vector2(197, -128)
var blackL = Vector2(495, -128)
var skinnedL = Vector2(782, -128)
var text
var selected = false
var canClick = true

func _ready() -> void:
	light.position = Vector2(-287, -128)
	light.color = mainC

func _on_orange_mouse_entered() -> void:
	if not selected:
		var tween = create_tween()
		canClick = false
		await tween.tween_property(light, "position", orangeL, 0.5)
		change_text('Selected : Mango')
		canClick = true


func _on_black_mouse_entered() -> void:
	if not selected:
		var tween = create_tween()
		canClick = false
		await tween.tween_property(light, "position", blackL, 0.5)
		canClick = true
		change_text('Selected : Morro')


func _on_skinned_mouse_entered() -> void:
	if not selected:
		var tween = create_tween()
		canClick = false
		await tween.tween_property(light, "position", skinnedL, 0.5)
		canClick = true
		change_text('Selected : Zorro')
	
func change_text(txt):
	label.text = txt
	
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT and canClick:
			if not selected:
				selected = true
				light.color = selectC
			else:
				selected = false
				light.color = mainC


func _on_button_pressed() -> void:
	var t = label.text
	if t == "Selected : Morro":
		C.now_cat = "black"
	elif t == "Selected : Zorro":
		C.now_cat = "skinned"
	else:
		C.now_cat = "orange"
	await Transition.transition_to_scene("res://tsch/levels.tscn")
	

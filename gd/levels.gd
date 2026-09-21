extends Node2D

@onready var one = $"Lvl one"
@onready var two = $"Lvl two"
@onready var three = $"Lvl three"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CanvasLayer/first.visible = false; $CanvasLayer/second.visible = false; $CanvasLayer/thrid.visible = false



func _on_lvl_one_pressed() -> void:
	await Transition.transition_to_scene("res://tsch/lv_l_1.tscn")
	Global.cScene = "Lvl1"

func _on_lvl_two_pressed() -> void:
	await Transition.transition_to_scene("res://tsch/lvl_2.tscn")
	Global.cScene = "Lvl2"

func _on_lvl_three_pressed() -> void:
	await Transition.transition_to_scene("res://tsch/levels.tscn")
	Global.cScene = "Lvl3"
	


func _on_button_pressed() -> void:
	get_tree().quit()

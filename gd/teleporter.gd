extends Node2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == $"../player":
		var now = Global.cScene
		if  now == "Lvl1":
			Global.Lvl1complete = true
			Transition.transition_to_scene("res://tsch/lvl_2.tscn")
		elif now == "Lvl2":
			Global.Lvl2complete = true
			Transition.transition_to_scene("res://tsch/levels.tscn")

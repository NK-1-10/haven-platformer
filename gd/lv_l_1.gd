extends Node2D
@onready var cat = $player
@onready var camera = $player/Camera2D
@onready var kittyCam = $Camera2D
@onready var kitty = $kitty

var hasEntered = false
var kittyPosition = Vector2(1302, 425)
var laterPosition = Vector2(1345, 425)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.cScene = "Lvl1" 
	$teleporter.visible = false
	cat.process_mode = Node.PROCESS_MODE_DISABLED
	kitty.position = kittyPosition
	kittyCam.make_current()
	start()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	Transition.transition_to_scene("res://tsch/levels.tscn")


func start():
	var target_pos = camera.global_position
	var start_pos = kittyCam.global_position

	kitty.play("lay")
	await kitty.animation_finished
	await get_tree().create_timer(1).timeout

	var tween = create_tween()
	await tween.tween_property(kittyCam, "global_position", target_pos, 2)

	await get_tree().create_timer(1).timeout
	camera.make_current()
	cat.process_mode = Node.PROCESS_MODE_INHERIT
	kittyCam.global_position = start_pos
	
	kitty.visible = false
	$teleporter.visible = true

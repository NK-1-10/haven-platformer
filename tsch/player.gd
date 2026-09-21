extends CharacterBody2D

@onready var sprite = $cat

const SPEED = 200.0
const JUMP_VELOCITY = -300.0
const ACCELERATION = 3000.0
const FRICTION = 3500.0

const COYOTE_TIME = 0.12
const JUMP_BUFFER_TIME = 0.12

var coyote_timer = 0.0
var jump_buffer_timer = 0.0

func _physics_process(delta: float) -> void:
	# gravity
	if not is_on_floor():
		velocity += get_gravity() * delta

	# coyote time: allow jumping briefly after walking off a ledge
	if is_on_floor():
		coyote_timer = COYOTE_TIME
	else:
		coyote_timer -= delta

	# jump buffer: remember a jump press briefly before landing
	if Input.is_action_just_pressed("ui_accept"):
		jump_buffer_timer = JUMP_BUFFER_TIME
	else:
		jump_buffer_timer -= delta

	if jump_buffer_timer > 0.0 and coyote_timer > 0.0:
		velocity.y = JUMP_VELOCITY
		jump_buffer_timer = 0.0
		coyote_timer = 0.0

	# variable jump height — let go early to cut the jump short
	if Input.is_action_just_released("ui_accept") and velocity.y < 0:
		velocity.y *= 0.5

	# horizontal movement with acceleration/friction instead of instant speed
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = move_toward(velocity.x, direction * SPEED, ACCELERATION * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, FRICTION * delta)

	move_and_slide()
	update_animation()

func update_animation() -> void:
	var anims = C.catTypes[C.now_cat]

	if not is_on_floor():
		if velocity.y < 0:
			sprite.play(anims["jump"])
		else:
			sprite.play(anims["fall"])
	elif abs(velocity.x) > 10:
		sprite.play(anims["walk"])
	else:
		sprite.play(anims["idle"])

	if abs(velocity.x) > 10:
		sprite.flip_h = velocity.x < 0

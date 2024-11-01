extends CharacterBody2D


const SPEED = 100.0
const MAXIMUM_OBTAINABLE_HEALTH = 400.0
enum STATES {IDLE=0, DEAD, DAMAGED, ATTACKING, CHARGING}

@export var data = {
	"max_health": 60.0, #20hp/heart, 5 per fraction
	"health": 60, # Min 60 Max 400
	"money": 0,
	"state": STATES.IDLE,
	"secondaries": [],
}

var inertia = Vector2()
var look_direction = Vector2.DOWN

func _physics_process(delta: float) -> void:
	var direction = Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up", "ui_down")
	)
	if direction.length() > 0: # magnitude
		look_direction = direction
		# Scale to 1 to prevent speed boost from diaglonals
		direction = direction.normalized()
		velocity = direction * SPEED
	else:
		velocity = velocity.move_toward(Vector2.ZERO, SPEED)
	velocity += inertia
	update_animation(direction)
	move_and_slide()
	inertia = inertia.move_toward(Vector2.ZERO, delta*1000)

func update_animation(direction):
	var a_name = "idle_"
	if direction.length() > 0:
		a_name = "walk_"
	if look_direction.x != 0:
		a_name += "side" # append "side" to idle/walk
		$AnimatedSprite2D.flip_h = look_direction.x < 0
	elif look_direction.y < 0:
		a_name += "up"
	elif look_direction.y > 0:
		a_name += "down"
	$AnimatedSprite2D.animation = a_name
	$AnimatedSprite2D.play()
	pass

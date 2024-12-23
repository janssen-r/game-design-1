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
var attack_direction = look_direction
var animation_lock = 0.0 # Lock player during attack anim
var damage_lock = 0.0 # Invincibility frames
var charge_time = 2.5
var charge_duration = 0.0

var slash_scene = preload("res://assets/sprites/zelda_like/gfx/entities/attacks/slash.tscn")
var damage_shader = preload("res://assets/shaders/take_damage.tres")
var attack_sound = preload("res://assets/sounds/slash.wav")
var death_sound = preload("res://assets/sounds/death.wav")
var hurt_sound = preload("res://assets/sounds/hurt.wav")
var coin_sound = preload("res://assets/sounds/coin_pickup.wav")
var heart_sound = preload("res://assets/sounds/health_pickup.wav")
var charge_sound = preload ("res://assets/sounds/charging.wav")
# TODO: atack/preload sounds = DONE
# aud_player.stream = whatever_sound
# aud_player.play()

@onready var p_HUD = get_tree().get_first_node_in_group ("HUD")
@onready var aud_player = $AudioStreamPlayer2D


func get_direction_name():
	return ["right", "down", "left", "up"][
		int(round(look_direction.angle() * 2 / PI)) % 4
	]

func attack():
	data.state = STATES.ATTACKING
	var dir_name = get_direction_name()
	if dir_name == "left":
		$AnimatedSprite2D.flip_h = 0
	$AnimatedSprite2D.play("swipe_" + dir_name)
	attack_direction = look_direction
	var slash = slash_scene.instantiate()
	slash.position = attack_direction * 20.0
	slash.rotation = Vector2().angle_to_point(-attack_direction)
	add_child(slash)
	aud_player.stream = attack_sound
	aud_player.play()
	animation_lock = 0.2
	
func charged_attack():
	data.state = STATES.ATTACKING
	$AnimatedSprite2D.play("swipe_charge")
	aud_player.stream = charge_sound
	aud_player.play()
	attack_direction = -look_direction
	damage_lock = 0.3
	for i in range(9):
		# offset by (*i*teration - 4) * 45 degrees [-4, 4]
		var angle = attack_direction.angle() + (i-4) * PI/4
		var dir = Vector2(cos(angle), sin(angle))
		var slash = slash_scene.instantiate()
		slash.position = dir * 20
		slash.rotation = Vector2().angle_to_point(-dir)
		slash.damage *= 1.5
		add_child(slash)
		await get_tree().create_timer(0.03).timeout # Short wait
	animation_lock = 0.2
	await $AnimatedSprite2D.animation_finished
	data.state = STATES.IDLE

func _on_ready() -> void:
	p_HUD.show()

func pickup_health(value):
	aud_player.stream = heart_sound
	aud_player.play()
	data.health += value
	data.health = clamp(data.health, 0, data.max_health)

func pickup_heartcontainer():
	if data.max_health < MAXIMUM_OBTAINABLE_HEALTH:
		data.max_health += 20
		data.health += 20

func pickup_money(value):
	aud_player.stream = coin_sound
	aud_player.play()
	data.money += value

signal health_depleted

func take_damage(dmg):
	if damage_lock == 0.0:
		data.health -= dmg
		data.state = STATES.DAMAGED
		damage_lock = 0.5
		animation_lock = dmg * 0.005
		$AnimatedSprite2D.material = damage_shader.duplicate()
		$AnimatedSprite2D.material.set_shader_parameter("intensity", 0.5)
		
		if data.health > 0:
			aud_player.stream = hurt_sound
			aud_player.play()
			pass
		else:
				data.state = STATES.DEAD 
				# death animation & SFX
				aud_player.stream = death_sound
				aud_player.play()
				await get_tree().create_timer(0.5).timeout
				health_depleted.emit
	pass

func _physics_process(delta: float) -> void:
	animation_lock = max(animation_lock-delta, 0.0)
	damage_lock = max(damage_lock-delta, 0.0)
	
	if animation_lock == 0 and data.state != STATES.DEAD:
		if data.state == STATES.DAMAGED and max(damage_lock-delta, 0.0):
			$AnimatedSprite2D.material = null;
		
		if data.state != STATES.CHARGING:
			data.state = STATES.IDLE
			
		if Input.is_action_just_pressed("ui_select"): #Enter
			for entity in get_tree().get_nodes_in_group("Interactable"):
				if entity.in_range(self):
					entity.interact(self)
					data.state = STATES.IDLE
					return
	
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
	if data.state != STATES.DEAD:
		if Input.is_action_just_pressed("ui_accept"):
			attack()
			charge_duration = 0.0
			data.state = STATES.CHARGING
		
		charge_duration += delta
		if Input.is_action_just_released("ui_accept"):
			if charge_duration >= charge_time and \
			data.state == STATES.CHARGING:
				charged_attack()

func update_animation(direction):
	if data.state == STATES.IDLE:
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

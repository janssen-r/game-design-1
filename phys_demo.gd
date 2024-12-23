extends Node2D

var phys_ball = preload("res://phys_ball.tscn")
var bomb = preload("res://phys_explosion.tscn")

func _ready() -> void:
	$Panel/GravSlider.value = $phys_ball.gravity_scale
	
func _input(event: InputEvent) -> void: 
	if event is InputEventMouseButton and event.pressed:
		var nball = phys_ball.instantiate()
		nball.position = event.position
		nball.gravity_scale = $Panel/GravSlider.value
		nball.inertia = float($Panel/txtInertia.text)
		nball.linear_velocity = Vector2(float($Panel/txtVelX.text), float($Panel/txtVelY.text))
		add_child(nball)

func _keyinput(event: InputEvent) -> void: 
	if event is InputEventKey and event.pressed:
		var bomb = bomb.instantiate()
		bomb.position = event.position
		bomb.gravity_scale = $Panel/GravSlider.value
		bomb.inertia = float($Panel/txtInertia.text)
		bomb.linear_velocity = Vector2(float($Panel/txtVelX.text), float($Panel/txtVelY.text))
		add_child(bomb)
		$StaticBody2D/phys_explosion/Timer.timeout

func _on_grav_slider_value_changed(value: float) -> void:
		for child in get_children():
			if child is RigidBody2D:
				child.gravity_scale = value

func _on_button_pressed() -> void:
	for child in get_children():
		if child is RigidBody2D:
			var force = randi_range(50, 1000)
			child.apply_central_force(Vector2(1,0) * force)
			# Vector2.RIGHT

func _on_button_2_pressed() -> void:
	var inertia = float($Panel/txtInertia.text)
	var v_x = float($Panel/txtVelX.text)
	var v_y = float($Panel/txtVelY.text)
	var velocity = Vector2(v_x, v_y)
	for child in get_children():
		if child is RigidBody2D:
			child.inertia = inertia
			child.linear_velocity = velocity


func _on_child_exiting_tree(node: Node) -> void:
	
	Node.position = 
	for child in get_children():
		if child is RigidBody2D:
			pass

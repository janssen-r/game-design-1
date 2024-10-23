extends RigidBody2D

func _process(delta: float) -> void:
	$Timer.start()
	
func _on_timer_timeout() -> void:
	self.queue_free()

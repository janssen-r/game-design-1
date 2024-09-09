extends Control

func _on_btn_calc_pressed() -> void:
	var speedLimit = int($txtLimit.text)
	var carSpeed = int($txtSpeed.text)
	var milesOver = carSpeed-speedLimit
	var fine = 20.0 + (milesOver * 5.0)
	$lblTotal.text = "$ %.2f" % fine # Rounds fine to 2 decimal pts
	

func _on_btn_clear_pressed() -> void:
	$lblTotal.text = "$"
	$txtLimit.text = ""
	$txtSpeed.text = ""

func _on_btn_exit_pressed() -> void:
	get_tree().quit()

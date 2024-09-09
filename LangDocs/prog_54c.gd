extends Control

func _on_btn_calc_pressed() -> void:
	const pi = float(3.14159)
	var rad = float($txtRad.text)
	var circum = float(2 * pi * rad)
	var area = float((pi * rad)**2)
	$lblArea.text = "Area: " + str(area)
	$lblCirc.text = "Circumference: " + str(circum)

func _on_btn_clear_pressed() -> void:
	$lblArea.text = "Area: "
	$lblCirc.text = "Circumference: "
	$txtRad.text = ""


func _on_btn_exit_pressed() -> void:
	get_tree().quit()

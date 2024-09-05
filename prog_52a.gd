extends Control

func _on_btn_calc_pressed() -> void:
	var length = int($txtLength.text)
	var width = int ($txtWidth.text)
	var area = int (length*width)
	var perim = int (2*length+2*width)
	$lblArea.text = "Area: " + str(area)
	$lblPerim.text = "Perimeter: " + str(perim)
	# Operators: + - * / %    ** exponent
	# str means string (text)
	# int means integer (whole #)
	# float means a floating point number (w/ decimal)

func _on_btn_clear_pressed() -> void:
	$txtLength.text = ""
	$txtWidth.text = ""
	$lblArea.text = ""
	$lblPerim.text = ""

func _on_btn_clear_2_pressed() -> void:
	get_tree().quit()

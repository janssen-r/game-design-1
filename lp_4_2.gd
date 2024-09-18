extends Control

func _on_btn_calc_pressed() -> void:
	var weight = int($txtWeight.text)
	var length = int($txtLength.text)
	var width = int($txtWidth.text)
	var height = int($txtHeight.text)
	var dimen = (length * width * height)
	var weightover = 0
	var dimenover = 1
	if weight > 27:
		weightover = 1
		return
	if dimen > 100000:
		dimenover = 1
		return
	if dimenover > 0 and weightover > 0:
		$lblOutput.text = "Too heavy and too large"
	elif dimenover > 0:
		$lblOutput.text = "Too Large"
	elif weightover > 0:
		$lblOutput.text = "Too Heavy"
	else: 
		$lblOutput.text = "Acceptable package"
		return

func _on_btn_clear_pressed() -> void:
	$lblOutput.text = ""
	$txtHeight.text = ""
	$txtWidth.text = ""
	$txtLength.text = ""
	$txtWeight.text = ""

func _on_btn_exit_pressed() -> void:
	get_tree().quit()

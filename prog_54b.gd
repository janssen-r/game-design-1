extends Control

func _on_btn_calc_pressed() -> void:
	var val1 = int($txtNum1.text)
	var val2 = int($txtNum2.text)
	var val3 = int($txtNum3.text)
	var val4 = int($txtNum4.text)
	var sum = int(val1+val2+val3+val4)
	var avg = int((val1+val2+val3+val4)/4)
	$lblSum.text = "Sum: " + str(sum)
	$lblAvg.text = "Average: " + str(avg)
	
func _on_btn_clear_pressed() -> void:
	$lblSum.text = "Sum: "
	$lblAvg.text = "Average: "
	$txtNum1.text = ""
	$txtNum2.text = ""
	$txtNum3.text = ""
	$txtNum4.text = ""

func _on_btn_exit_pressed() -> void:
	get_tree().quit()

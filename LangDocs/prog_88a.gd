extends Control

func _on_btn_calc_pressed() -> void:
	var num1 = int($txt1.text)
	var num2 = int($txt2.text)
	var Sum = num1 + num2
	var Diff = num1 - num2
	var Prod = num1 * num2
	var Avg = Sum / 2
	var Abs = abs(Diff)
	var Max = 0
	var Min = 0
	
	if num1 > num2:
		Max = num1
		# you could also set Min = num2
	else:
		Max = num2
		
	if Max == num1: # Check if same val
		Min = num2
	else:
		Min = num1
	
	$Label.text = "Sum: " + str(Sum) + \
				  "\nDifference: " + str(Diff) + \
				
				"\nAbs. Distance: " + str(Abs) + \
				"\nMax: " + str(Max) + \
				"\nMin: " + str(Min) + \
				"\nProd: " + str(Prod) + \
				"\nAvg: " + str(Avg) 

func _on_btn_clear_pressed() -> void:
	$Label.text = ""
	$txt1.text = ""
	$txt2.text = ""


func _on_btn_exit_pressed() -> void:
	get_tree().quit()

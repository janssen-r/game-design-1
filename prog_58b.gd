extends Control

func _on_btn_calc_pressed() -> void:
	var numA = int($txtA.text)
	var numB = int($txtB.text)
	var numC = int($txtC.text)
	var root1 = (-numB + (sqrt(numB**2 - 4 * numA * numC) / 2 * numA))
	var root2 = (-numB - (sqrt(numB**2 - 4 * numA * numC) / 2 * numA))
	
	$lblOutput.text = "The roots are: " + str(root1) + " & " + str(root2)

func _on_btn_clear_pressed() -> void:
	$lblOutput.text = ""

func _on_btn_exit_pressed() -> void:
	get_tree().quit()

extends Control

func _on_btn_calc_pressed() -> void:
	var a = int($txtA.text)
	var b = int($txtB.text)
	var c = int($txtC.text)
	var root1 = (-b+(b**2 - 4*a*c)**(1/2)/ 2*a)
	var root2 = (-b-(b**2 - 4*a*c)**(1/2)/ 2*a)
	
	$lblOutput.text = "The roots are: " str(root1) + str(root2)
	

func _on_btn_clear_pressed() -> void:
	$lblOutput.text = "The roots are: "

func _on_btn_exit_pressed() -> void:
	pass # Replace with function body.

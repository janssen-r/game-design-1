extends Control

func _on_btn_calc_pressed() -> void:
	var  mySum = 0
	var lcv = 3 # loop control var
	while lcv <= 9669: # run while condition is true
		mySum += lcv
		$ItemList.add_item(str(mySum))
		lcv += 3 # lcv = lcv + 3
		# alternatively, for lcv in range (3, 9670) etc.

func _on_btn_clear_pressed() -> void:
	$ItemList.clear()

func _on_btn_exit_pressed() -> void:
	get_tree().quit()

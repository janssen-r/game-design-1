extends Control

func _on_btn_calc_pressed() -> void:
	var hours = str(4)
	for num in range(1,41):
		$ItemList.add_item (hours)
		int(hours) += 4

func _on_btn_clear_pressed() -> void:
	pass # Replace with function body.

func _on_btn_exit_pressed() -> void:
	pass # Replace with function body.

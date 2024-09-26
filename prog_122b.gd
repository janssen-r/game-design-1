extends Control

func _on_btn_calc_pressed() -> void:
	var hours
	while hours < 40:
		ItemList.addItem str(hours)
		hours += 2

func _on_btn_clear_pressed() -> void:
	pass # Replace with function body.

func _on_btn_exit_pressed() -> void:
	pass # Replace with function body.

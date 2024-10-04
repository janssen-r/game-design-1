extends Control

func _on_btn_calc_pressed() -> void:
	var pay = 4
	var hours = 1
	pay = str(4)
	hours = str(1)
	for num in range(1,41):
		pay = str(pay)
		$ItemList.add_item (pay)
		pay = int(pay)
		pay += 4

	for num in range (1,41):
		hours = str(hours)
		$ItemListHours.add_item (hours)
		hours = int(hours)
		hours += 1

func _on_btn_clear_pressed() -> void:
	$ItemList.clear()
	$ItemListHours.clear()

func _on_btn_exit_pressed() -> void:
	get_tree().quit()

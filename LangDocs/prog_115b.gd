extends Control

func _on_btn_calc_pressed() -> void:
	var val = 2
	while val <= 36:
		$lblOut.text = $lblOut.text + " " + str(val)
		val += 2

func _on_btn_2_clear_pressed() -> void:
	$lblOut.text = ""

func _on_btn_3_exit_pressed() -> void:
	get_tree().quit()

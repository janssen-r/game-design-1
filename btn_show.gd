extends Button

func _on_pressed() -> void:
	$Label.text = "Riley"

func _on_btn_clear_pressed() -> void:
	$Label.text = " "

func _on_btn_exit_pressed() -> void:
	get_tree().quit()

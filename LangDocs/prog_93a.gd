extends Control

func _on_btn_calc_pressed() -> void:
	var Kwh = float($txtKwh.text)
	var Base = Kwh * 0.0475
	var Sur = Base * 0.1
	var Tax = Base * 0.03
	var Total = Base + Sur + Tax
	var Penalty = Total + (Total * 0.04)
	$lblBase.text = "Base Cost: " + str(Base)
	$lblSur.text = "Surcharge: " + str(Sur)
	$lblTax.text = "City Tax: " + str(Tax)
	$lblTotal.text = "Total: " + str(Total)
	$lblPenalty.text = "After May 20th: " + str(Penalty)

func _on_btn_calc_2_pressed() -> void:
	$lblBase.text = "Base Cost: "
	$lblSur.text = "Surcharge: "
	$lblTax.text = "City Tax: "
	$lblTotal.text = "Total: "
	$lblPenalty.text = "After May 20th: "
	$txtKwh.text = ""

func _on_btn_calc_3_pressed() -> void:
	get_tree().quit()

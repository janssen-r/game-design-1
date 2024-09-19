extends Control

func _on_btn_calc_pressed() -> void:
	var eggs = int($txtEggNum.text)
	var dozens = floor(eggs / 12)
	var remainder = eggs % 12 # MOD (%) is remainder
	var pricePer = 0
	if dozens < 4:
		pricePer = (0.50)
	elif dozens < 6:
		pricePer = (0.45)
	elif dozens < 11:
		pricePer = (0.40)
	elif dozens >= 11:
		pricePer = (0.35)

	var remainderCost = (remainder * (pricePer/12.0))
	var dozenCost = dozens * pricePer
	var totalCost = dozenCost + remainderCost
	
	$lblPrice.text = "Price: " + str(totalCost)

func _on_btn_clear_pressed() -> void:
	$lblPrice.text= "Price: "
	$txtEggNum.text = ""

func _on_btn_exit_pressed() -> void:
	get_tree().quit()

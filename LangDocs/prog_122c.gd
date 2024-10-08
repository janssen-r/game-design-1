extends Control

func _on_btn_calc_pressed() -> void:
	
	var baseNum = 1
	var plusOne = 1
	var timesTwo = 1
	var squared = 1
	
	for num in range(1,6):
		baseNum +=1
		baseNum = str(baseNum)
		$ItemList.add_item(baseNum)
		baseNum = int(baseNum)
		plusOne = baseNum + 1
		plusOne = str(plusOne)
		$ItemList.add_item(plusOne)
		timesTwo = baseNum * 2
		timesTwo = str(timesTwo)
		$ItemList.add_item(timesTwo)
		squared = baseNum**2
		squared = str(squared)
		$ItemList.add_item(squared)
		$ItemList.add_item(baseNum "/n" plusOne "/n" timesTwo "/n" squared)
		baseNum = int(baseNum)
		plusOne = int(plusOne)
		timesTwo = int(timesTwo)
		squared = int(squared)

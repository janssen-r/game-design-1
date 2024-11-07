extends BaseItem

func _init(): super._init(1) # 1 money

func interact(player):
	player.pickup_money(value)
	remove()

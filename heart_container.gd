extends BaseItem
func interact(player):
	player.pickup_heartcontainer()
	remove()
